# FULL-COVERAGE adversarial review — HalfUpRounding (87 remaining units)

Auditor: independent general subagent (session ses_de9e4c19fffeaainD8w6JxVint).
Full-coverage mechanical check followed by an equivalence re-review of the
four disputed units. Reproduce with
`data/evidence_audits/full_coverage_halfup_source_fidelity.py`.
Not legal advice; not a completeness claim.

## Full-coverage mechanical pass
Across all 87 units: pinned SHA-256 87/87; norm_fragment substring of full
text 87/87; full text contains an `円未満の端数` phrase and `四捨五入` 83/87;
threshold kanji consistent with the assigned HalfUpRounding implementation
83/87. Lean files byte-identical to HEAD; no forbidden proof tokens;
universal agreement theorems unchanged.

## Four disputed units — H/T/D/C/U
`a112a33c…`, `8d90ed35…`, `c4eedc93…`, `14870787…` use the verbatim phrase
「五百円未満の端数があるときはその端数金額を切り捨て、五百円以上千円未満の
端数があるときはその端数金額を千円とする」 — no literal 四捨五入.

- H: a literal-word check implied the assigned `roundHalfUpThousand` model was wrong.
- T: independent Python equivalence test over 186,339 values (0..500k step 3
  + boundaries + 20,000 random values to 10^7) between the statute formula
  `a - a%1000 + (1000 if a%1000 >= 500 else 0)` and `roundHalfUp(a,1000)`:
  **0 mismatches**. A second 200,000-value check also found 0 mismatches.
- D: VERDICT PASS — wording/evidence-phrasing issue, not a model error.
- C: 日本語 expresses the same half-up-at-1000 operation through the 500/1000
  split rather than the word 四捨五入.
- U: surrounding calculation context beyond the exact phrase remains out of scope.

The legacy unfaithful `FloorRoundingMinimum` family axes were removed from
these four units; only the equivalent `HalfUpRounding` evidence remains.
ADVERSARIAL_REVIEW recorded for all 87 units on this basis.
