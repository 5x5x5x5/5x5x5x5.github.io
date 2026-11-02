#!/usr/bin/env bash
# Download the 64 Wikimedia Commons recordings Formant Flyer uses into formant/_raw/.
# Run from the repository root:  bash formant/tools/fetch-clips.sh
# Then commit formant/_raw/ and push; the clips get converted and _raw/ removed afterwards.
set -u
cd "$(dirname "$0")/.." && mkdir -p _raw && cd _raw
UA="FormantFlyer/1.0 (https://5x5x5x5.github.io/formant/) curl"
fail=0
while read -r name url; do
  [ -s "$name" ] && continue
  echo "$name"
  curl -fsSL -A "$UA" --retry 5 --retry-delay 5 -o "$name" "$url" || { echo "  FAILED: $url"; rm -f "$name"; fail=1; }
  sleep 1
done <<'LIST'
voiceless-bilabial-plosive.ogg https://upload.wikimedia.org/wikipedia/commons/5/51/Voiceless_bilabial_plosive.ogg
voiced-bilabial-plosive.ogg https://upload.wikimedia.org/wikipedia/commons/2/2c/Voiced_bilabial_plosive.ogg
voiceless-alveolar-plosive.ogg https://upload.wikimedia.org/wikipedia/commons/0/02/Voiceless_alveolar_plosive.ogg
voiced-alveolar-plosive.ogg https://upload.wikimedia.org/wikipedia/commons/0/01/Voiced_alveolar_plosive.ogg
voiceless-retroflex-plosive.oga https://upload.wikimedia.org/wikipedia/commons/b/b0/Voiceless_retroflex_stop.oga
voiced-retroflex-plosive.oga https://upload.wikimedia.org/wikipedia/commons/2/27/Voiced_retroflex_stop.oga
voiceless-palatal-plosive.ogg https://upload.wikimedia.org/wikipedia/commons/5/5d/Voiceless_palatal_plosive.ogg
voiced-palatal-plosive.ogg https://upload.wikimedia.org/wikipedia/commons/1/1d/Voiced_palatal_plosive.ogg
voiceless-velar-plosive.ogg https://upload.wikimedia.org/wikipedia/commons/e/e3/Voiceless_velar_plosive.ogg
voiced-velar-plosive.ogg https://upload.wikimedia.org/wikipedia/commons/1/12/Voiced_velar_plosive_02.ogg
voiceless-uvular-plosive.ogg https://upload.wikimedia.org/wikipedia/commons/1/19/Voiceless_uvular_plosive.ogg
voiced-uvular-plosive.oga https://upload.wikimedia.org/wikipedia/commons/b/b6/Voiced_uvular_stop.oga
voiceless-glottal-plosive.ogg https://upload.wikimedia.org/wikipedia/commons/4/4d/Glottal_stop.ogg
voiced-bilabial-nasal.ogg https://upload.wikimedia.org/wikipedia/commons/a/a9/Bilabial_nasal.ogg
voiced-labiodental-nasal.ogg https://upload.wikimedia.org/wikipedia/commons/1/18/Labiodental_nasal.ogg
voiced-alveolar-nasal.ogg https://upload.wikimedia.org/wikipedia/commons/2/29/Alveolar_nasal.ogg
voiced-retroflex-nasal.ogg https://upload.wikimedia.org/wikipedia/commons/a/af/Retroflex_nasal.ogg
voiced-palatal-nasal.ogg https://upload.wikimedia.org/wikipedia/commons/4/46/Palatal_nasal.ogg
voiced-velar-nasal.ogg https://upload.wikimedia.org/wikipedia/commons/3/39/Velar_nasal.ogg
voiced-uvular-nasal.ogg https://upload.wikimedia.org/wikipedia/commons/3/3e/Uvular_nasal.ogg
voiced-bilabial-trill.ogg https://upload.wikimedia.org/wikipedia/commons/e/e7/Bilabial_trill.ogg
voiced-alveolar-trill.ogg https://upload.wikimedia.org/wikipedia/commons/c/ce/Alveolar_trill.ogg
voiced-uvular-trill.ogg https://upload.wikimedia.org/wikipedia/commons/c/cb/Uvular_trill.ogg
voiced-labiodental-tap-or-flap.ogg https://upload.wikimedia.org/wikipedia/commons/2/2c/Labiodental_flap.ogg
voiced-alveolar-tap-or-flap.ogg https://upload.wikimedia.org/wikipedia/commons/a/a0/Alveolar_tap.ogg
voiced-retroflex-tap-or-flap.ogg https://upload.wikimedia.org/wikipedia/commons/8/87/Retroflex_flap.ogg
voiceless-bilabial-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/4/41/Voiceless_bilabial_fricative.ogg
voiced-bilabial-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/3/37/Voiced_bilabial_fricative.ogg
voiceless-labiodental-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/c/c7/Voiceless_labio-dental_fricative.ogg
voiced-labiodental-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/4/42/Voiced_labio-dental_fricative.ogg
voiceless-dental-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/8/80/Voiceless_dental_fricative.ogg
voiced-dental-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/6/6a/Voiced_dental_fricative.ogg
voiceless-alveolar-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/a/ac/Voiceless_alveolar_sibilant.ogg
voiced-alveolar-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/c/c0/Voiced_alveolar_sibilant.ogg
voiceless-postalveolar-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/c/cc/Voiceless_palato-alveolar_sibilant.ogg
voiced-postalveolar-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/3/30/Voiced_palato-alveolar_sibilant.ogg
voiceless-retroflex-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/b/b1/Voiceless_retroflex_sibilant.ogg
voiced-retroflex-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/7/7f/Voiced_retroflex_sibilant.ogg
voiceless-palatal-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/a/ab/Voiceless_palatal_fricative.ogg
voiced-palatal-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/a/ac/Voiced_palatal_fricative.ogg
voiceless-velar-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/0/0f/Voiceless_velar_fricative.ogg
voiced-velar-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/4/47/Voiced_velar_fricative.ogg
voiceless-uvular-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/c/c8/Voiceless_uvular_fricative.ogg
voiced-uvular-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/a/af/Voiced_uvular_fricative.ogg
voiceless-pharyngeal-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/b/b2/Voiceless_pharyngeal_fricative.ogg
voiced-pharyngeal-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/c/cd/Voiced_pharyngeal_fricative.ogg
voiceless-glottal-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/d/da/Voiceless_glottal_fricative.ogg
voiced-glottal-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/e/e2/Voiced_glottal_fricative.ogg
voiceless-alveolar-lateral-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/e/ea/Voiceless_alveolar_lateral_fricative.ogg
voiced-alveolar-lateral-fricative.ogg https://upload.wikimedia.org/wikipedia/commons/6/6f/Voiced_alveolar_lateral_fricative.ogg
voiced-labiodental-approximant.ogg https://upload.wikimedia.org/wikipedia/commons/e/ee/Labiodental_approximant.ogg
voiced-alveolar-approximant.ogg https://upload.wikimedia.org/wikipedia/commons/1/1f/Alveolar_approximant.ogg
voiced-retroflex-approximant.oga https://upload.wikimedia.org/wikipedia/commons/b/bf/Retroflex_Approximant2.oga
voiced-palatal-approximant.ogg https://upload.wikimedia.org/wikipedia/commons/e/e8/Palatal_approximant.ogg
voiced-velar-approximant.ogg https://upload.wikimedia.org/wikipedia/commons/5/5c/Voiced_velar_approximant.ogg
voiced-alveolar-lateral-approximant.ogg https://upload.wikimedia.org/wikipedia/commons/b/bc/Alveolar_lateral_approximant.ogg
voiced-retroflex-lateral-approximant.ogg https://upload.wikimedia.org/wikipedia/commons/d/d1/Retroflex_lateral_approximant.ogg
voiced-palatal-lateral-approximant.ogg https://upload.wikimedia.org/wikipedia/commons/d/d9/Palatal_lateral_approximant.ogg
voiced-velar-lateral-approximant.ogg https://upload.wikimedia.org/wikipedia/commons/d/d3/Velar_lateral_approximant.ogg
bilabial-click.ogg https://upload.wikimedia.org/wikipedia/commons/9/9a/Bilabial_click.ogg
dental-click.ogg https://upload.wikimedia.org/wikipedia/commons/1/1f/Dental_click.ogg
alveolar-lateral-click.ogg https://upload.wikimedia.org/wikipedia/commons/f/f4/Alveolar_lateral_click.ogg
alveolar-click.ogg https://upload.wikimedia.org/wikipedia/commons/3/3c/Postalveolar_click.ogg
palatoalveolar-click.ogg https://upload.wikimedia.org/wikipedia/commons/8/89/Palatoalveolar_click.ogg
LIST
echo "done: $(ls | wc -l) files"; exit $fail
