# Formant Flyer — roadmap

Shipped (v1): vowel-trapezoid tunnel shooter. Pseudo-3D canvas projection, live
parallel formant synth (Web Audio), beat-locked spawns, five stages, glottal-stop
mines, diphthong ring trails, adaptive vowel weighting toward misses.
Shipped (v2): Ear mode. Targets are sung by a second voice (ship ducks), fly
down the ship's own lane, reveal on capture; misses show the spot and re-sing.
Shipped (v3): Language runs. Spanish, Japanese, Italian, French (oral), German,
General American, Southern British, Turkish: language-specific vowel positions,
formants and diphthongs; three stages; separate bests per mode × language.

Not yet built, roughly in priority order:

1. **Place × Manner (consonant mode).** The pulmonic consonant chart becomes the
   tunnel cross-section (or a second "sector"). Voicing replaces lip rounding as
   the toggle. Fricatives leave hiss trails, plosives shake the screen, and nasals
   ripple. Row/column clears give combos. A bonus round for clicks ʘ ǀ ǃ ǂ ǁ.
   Decided: hybrid audio. CC-licensed Wikimedia Commons clips for target cues
   and Ear mode (~60 files, attribution page). The engine stays synthesized and
   follows only manner: hiss for fricatives, hum for nasals, buzz when voiced.
2. **Mic mode (stretch).** Steer by singing: in-browser LPC estimates F1/F2 from
   the microphone. It needs per-player calibration (corner vowels) and must stay
   optional, because formant tracking is noisy for high voices.
3. **More languages.** Danish, Swedish, Korean, Portuguese (with nasal vowels
   once the synth can nasalise), Mandarin.
4. **Phone-width consonant grid.** 11×8 cells don't fit portrait; zoomed or
   scrolling board.
5. Polish: per-speaker formant scaling slider, colour-blind palette check,
   leaderboard via shared artifact storage.
