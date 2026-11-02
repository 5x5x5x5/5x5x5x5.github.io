"""Convert raw Commons recordings to game clips and write the credits page.

Usage (from the repo root):  python3 -I formant/tools/build-clips.py formant
Reads   formant/tools/clips.json and formant/_raw/<slug>.<ext>
Writes  formant/audio/<slug>.mp3 and formant/credits.html

Each recording holds one or more takes separated by pauses. We keep the
first take only: from where sound starts to the first pause of >= 0.17 s
(shorter gaps, like a stop closure inside [apa], stay in), padded slightly,
capped at 1.4 s, loudness-normalised, mono 64 kb/s MP3.
"""
import html
import json
import os
import re
import subprocess
import sys

ROOT = sys.argv[1]
RAW, OUT = os.path.join(ROOT, '_raw'), os.path.join(ROOT, 'audio')
LEAD_MIN, MIN_GAP, PAD, CAP = 0.03, 0.17, 0.06, 1.4


def silences(path, min_len):
    log = subprocess.run(['ffmpeg', '-v', 'info', '-i', path, '-af', f'silencedetect=noise=-40dB:d={min_len}',
                          '-f', 'null', '-'], capture_output=True, text=True).stderr
    h, m, s = re.search(r'Duration: (\d+):(\d+):([\d.]+)', log).groups()
    ev = [(k, float(v)) for k, v in re.findall(r'silence_(start|end): ([\d.]+)', log)]
    return int(h)*3600 + int(m)*60 + float(s), ev


def first_take(path):
    """(start, end) seconds of the first utterance."""
    dur, lead = silences(path, LEAD_MIN)
    start = 0.0
    # leading silence (tolerate a click in the first 50 ms before it)
    if len(lead) > 1 and lead[0][0] == 'start' and lead[0][1] < 0.05:
        start = lead[1][1]
    _, gaps = silences(path, MIN_GAP)
    end = next((v for k, v in gaps if k == 'start' and v > start + 0.1), dur)
    if end + PAD > start + CAP:
        # Takes only ~0.15 s apart (no longer than a stop closure): cut at the
        # last short pause that still leaves at least 0.5 s of sound.
        _, short = silences(path, 0.1)
        cuts = [v for k, v in short if k == 'start' and start + 0.5 <= v <= start + CAP - PAD]
        if cuts: end = cuts[-1]
    start = max(0.0, start - 0.02)
    return start, min(end + PAD, start + CAP, dur)


def convert(clip):
    ext = os.path.splitext(clip['file'])[1]
    src, dst = os.path.join(RAW, clip['slug'] + ext), os.path.join(OUT, clip['slug'] + '.mp3')
    a, b = first_take(src)
    fade = min(0.08, (b - a) / 4)
    af = f'atrim={a:.3f}:{b:.3f},asetpts=PTS-STARTPTS,afade=t=in:d=0.005,afade=t=out:st={b - a - fade:.3f}:d={fade:.3f},loudnorm=I=-18:TP=-2:LRA=11'
    subprocess.run(['ffmpeg', '-v', 'error', '-y', '-i', src, '-af', af, '-ac', '1', '-ar', '44100',
                    '-c:a', 'libmp3lame', '-b:a', '64k', dst], check=True)
    return b - a


def credits_page(clips):
    e = html.escape
    def lic(c):
        return f'<a href="{e(c["licenseUrl"])}">{e(c["license"])}</a>' if c.get('licenseUrl') else e(c.get('license') or 'see file page')
    rows = '\n'.join(
        f'      <tr><td class="ipa">{e(c["glyph"])}</td><td>{e(c["name"])}</td>'
        f'<td><a href="{e(c["page"])}">{e(c["file"])}</a></td><td>{e(c["artist"])}</td><td>{lic(c)}</td></tr>'
        for c in clips)
    return f'''<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="color-scheme" content="dark">
<title>Formant Flyer Credits</title>
<meta name="description" content="Sources and licences for the consonant recordings used in Formant Flyer.">
<link href="https://fonts.googleapis.com/css2?family=Charis+SIL:wght@700&family=Orbitron:wght@700;900&display=swap" rel="stylesheet">
<style>
  :root{{--bg:#07020f;--ink:#ece9ff;--muted:#a39cd3;--edge:#3c2a74;--gold:#ffd166;--cyan:#3ff0ff}}
  *{{box-sizing:border-box}}
  body{{margin:0;background:var(--bg);color:var(--ink);font:15px/1.5 ui-sans-serif,system-ui,-apple-system,"Segoe UI",sans-serif;padding:24px 16px 48px}}
  main{{max-width:960px;margin:0 auto}}
  h1{{font:900 clamp(22px,6vw,34px) Orbitron,ui-monospace,monospace;margin:0 0 8px;color:var(--gold);letter-spacing:.04em}}
  p{{color:var(--muted);margin:0 0 14px}}
  a{{color:var(--cyan)}}
  .wrap{{overflow-x:auto;border:1px solid var(--edge);border-radius:10px}}
  table{{border-collapse:collapse;width:100%;font-size:14px}}
  th,td{{text-align:left;padding:8px 10px;border-bottom:1px solid #1e1440;vertical-align:top}}
  th{{font:700 11px Orbitron,ui-monospace,monospace;letter-spacing:.06em;color:var(--muted);background:#120828}}
  td.ipa{{font:700 22px "Charis SIL","Doulos SIL","Noto Sans",serif;color:var(--gold);text-align:center}}
  td a{{word-break:break-word}}
</style>
</head>
<body>
<main>
  <h1>Recording credits</h1>
  <p>Formant Flyer's consonant and click sounds are recordings from <a href="https://commons.wikimedia.org/">Wikimedia Commons</a>, used under the licences listed. Changes: only the first take of each recording is kept, cut to at most 1.4&nbsp;s, loudness-normalised and converted to mono MP3. The adapted clips are shared under the same licences as their sources. Vowels are synthesized live and use no recordings. <a href="./">Back to the game</a>.</p>
  <div class="wrap"><table>
    <thead><tr><th>IPA</th><th>Sound</th><th>Commons file</th><th>Author</th><th>Licence</th></tr></thead>
    <tbody>
{rows}
    </tbody>
  </table></div>
</main>
</body>
</html>
'''


def main():
    clips = json.load(open(os.path.join(ROOT, 'tools', 'clips.json')))
    os.makedirs(OUT, exist_ok=True)
    for c in clips:
        d = convert(c)
        print(f'{c["glyph"]}\t{d:.2f}s\t{c["slug"]}')
    with open(os.path.join(ROOT, 'credits.html'), 'w') as f:
        f.write(credits_page(clips))
    print('converted', len(clips))


if __name__ == '__main__':
    main()
