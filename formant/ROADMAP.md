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

Not yet built, roughly in priority order:

1. **Consonants phase 2.** Decided: hybrid audio. CC-licensed Wikimedia Commons clips for target cues
   and Ear mode (~60 files, attribution page). The engine stays synthesized and
   follows only manner (built in phase 1). Phase 2 adds the clips, consonant
   Ear mode, and the attribution page. Blocked on network access to
   commons.wikimedia.org and upload.wikimedia.org.
2. **Mic mode (stretch).** Steer by singing: in-browser LPC estimates F1/F2 from
   the microphone. It needs per-player calibration (corner vowels) and must stay
   optional, because formant tracking is noisy for high voices.
3. **More languages.** Danish, Swedish, Korean, Portuguese (with nasal vowels
   once the synth can nasalise), Mandarin.
4. Polish: per-speaker formant scaling slider, colour-blind palette check,
   leaderboard via shared artifact storage.
