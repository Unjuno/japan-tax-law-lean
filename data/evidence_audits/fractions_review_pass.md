# Independent re-review — corrected FractionAmounts binding (cycle 31)

Auditor: independent general subagent (session ses_dea29b81fffe3J0ucDa9ya0KfR).
Read-only re-review of the fix in `fractions_fix_resolution.md`.
Not legal advice; not a completeness claim.

## Verdict: PASS
- All 301 records re-parsed with an independent Python regex + `kansuji.py`:
  0 parse errors, **0 mismatches** for `num = kanji_to_int(after-分の)` and
  `den = kanji_to_int(before-分の)`; 50 distinct pairs. Tokens with a leading
  百 after 分の (百分の百四十, 百分の百十五) parse correctly.
- 8 sampled units with distinct fractions: (75,100), (1,2), (6,100),
  (416,1000), (44,287), (58,100), (15,100), (20,36). Verbatim token and
  norm_fragment found in each pinned source; SHA-256 matched. Independent
  recomputation from the Japanese numerals at a=1000 (e.g. 千分の四百十六
  → 416, 二百八十七分の四十四 → 153, 三十六分の二十 → 555) matched the model:
  0 mismatches.
- Lean theorems and sole assumption `0 < den` unchanged; `#print axioms`
  shows only `[propext, Quot.sound]` (omega artifact), no `sorryAx`;
  no forbidden tokens.
- The earlier systematic num/den reversal is confirmed resolved.

ADVERSARIAL_REVIEW recorded for the 8 sampled units only; the other 293
remain PROVED_SCOPE with a documented sampling gap. Source verification is
sampled, not a completeness claim.

Note: the fix resolution doc mentions a `correction` field; the data actually
carries `direction_note` on all 301 records (non-blocking doc discrepancy).
