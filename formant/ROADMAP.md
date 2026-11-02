# Formant Flyer — roadmap

Shipped (v1): vowel-trapezoid tunnel shooter. Pseudo-3D canvas projection, live
parallel formant synth (Web Audio), beat-locked spawns, five stages, glottal-stop
mines, diphthong ring trails, adaptive vowel weighting toward misses.
Shipped (v2): Ear mode. Targets are sung by a second voice (ship ducks), fly
down the ship's own lane, reveal on capture; misses show the spot and re-sing.
Shipped (v3): Language runs. Spanish, Japanese, Italian, French (oral), German,
General American, Southern British, Turkish: language-specific vowel positions,
formants and diphthongs; three stages; separate bests per mode × language.
Shipped (v4, consonants phase 1): pulmonic consonant chart as the tunnel
cross-section, voicing toggle, 59 consonants over five stages, synthesized
manner-driven engine (voice bar, hum, trill AM, place-tuned frication, plosive
bursts and tap dips on the beat), manner effects, row/column clears, click
trail bonus, ‖ pause mines, phone zoom-and-pan.
Shipped (v5, consonants phase 2): 64 Wikimedia Commons recordings (59
consonants + 5 clicks, mostly Peter Isotalo, CC BY-SA 3.0) cut to their first
take, normalised, MP3 (~0.6 MB). Played on capture and for the click trail;
new Consonants by ear mode; credits.html. Rebuild with
formant/tools/fetch-clips.sh then build-clips.py.

Not yet built, roughly in priority order:

1. **Mic mode (stretch).** Steer by singing: in-browser LPC estimates F1/F2 from
   the microphone. It needs per-player calibration (corner vowels) and must stay
   optional, because formant tracking is noisy for high voices.
2. **More languages.** Danish, Swedish, Korean, Portuguese (with nasal vowels
   once the synth can nasalise), Mandarin.
3. Polish: per-speaker formant scaling slider, colour-blind palette check,
   leaderboard via shared artifact storage.
