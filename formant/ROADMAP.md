# Formant Flyer — roadmap

Shipped (v1): vowel-trapezoid tunnel shooter. Pseudo-3D canvas projection, live
parallel formant synth (Web Audio), beat-locked spawns, five stages, glottal-stop
mines, diphthong ring trails, adaptive vowel weighting toward misses.
Shipped (v2): Ear mode. Targets are sung by a second voice (ship ducks), fly
down the ship's own lane, reveal on capture; misses show the spot and re-sing.

Not yet built, roughly in priority order:

1. **Place × Manner (consonant mode).** The pulmonic consonant chart becomes the
   tunnel cross-section (or a second "sector"). Voicing replaces lip rounding as
   the toggle. Fricatives leave hiss trails, plosives shake the screen, and nasals
   ripple. Row/column clears give combos. A bonus round for clicks ʘ ǀ ǃ ǂ ǁ.
   Open question: synthesized consonants vs. CC-licensed Wikimedia Commons clips
   (~60 files + attribution).
2. **Mic mode (stretch).** Steer by singing: in-browser LPC estimates F1/F2 from
   the microphone. It needs per-player calibration (corner vowels) and must stay
   optional, because formant tracking is noisy for high voices.
3. **Language runs.** Restrict the pool to a real vowel inventory (Spanish 5,
   Danish ~13+, Japanese 5, English dialects) with that language's diphthongs.
4. **Phone-width consonant grid.** 11×8 cells don't fit portrait; zoomed or
   scrolling board.
5. Polish: per-speaker formant scaling slider, colour-blind palette check,
   leaderboard via shared artifact storage.
