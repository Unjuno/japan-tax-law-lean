# Cycle 114 — 租税特別措置法 art. 10(3)(3) 控除割増率

This is a **status record**, not a completion claim. It keeps the three status
axes of the directive separate: 技術的検証済み / 形式化未完了 / 法的レビュー未完了.

## Selected obligation (INSPECT → SELECT)

- Normative id: `NORM|b1aa09eb096d7d23f144edb485e04f1792ac94e62641d6b3a1f14cf170de0250`
- Law: `332AC0000000026` (租税特別措置法), revision `332AC0000000026_20261101_507AC0000000013`
- Provision: art. `10`, paragraph 3, item 3, column 2, sentence 1; kind `CONDITION`;
  no unresolved conditions, no dependencies.
- Pinned clause (verbatim), independently re-extracted from the raw snapshot:

  > 当該試験研究費割合から百分の十を控除した割合に二を乗じて計算した割合（当該割合に小数点以下三位未満の端数があるときはこれを切り捨てた割合とし、当該計算した割合が百分の十を超えるときは百分の十とする。）

## FORMALIZE (spec and implementation constructed independently)

- `JapanTaxLaw/RndSurchargeRate.lean`: integer slice in units of 1/100000 of a
  percent; 10% cap and three-decimal truncation are **separate** operations
  (addition, modulo subtraction, conditional cap).
- `JapanTaxLaw/RndSurchargeRateSpec.lean`: independent restatement using
  multiplication, division and `min`; the doc-comment declares the law id,
  revision and art. 10 so the spec-scope gate can reject undeclared units.
- `JapanTaxLaw/RndSurchargeRateTests.lean`: six kernel-decided examples covering
  zero, small input, the threshold, truncation and saturation.
- Pinned transcription check and machine-extracted independent review:
  `docs/adversarial/reviews-rnd-surcharge.md` (H/T/D/C/U recorded).
- NOT MODELLED: the 試験研究費割合 computation itself, other items/paragraphs,
  multiplication into the tax amount, applicable years and certification.

## PROVE / CHALLENGE / VERIFY (measured)

- Local `lake build`: **1768 jobs, success** (includes the three new modules).
- `python scripts/ci/transcription_audit.py`: **534/534** checks passed.
- `python scripts/ci/verify_queue_invariants.py`: **16/16** after restoring the
  dropped umbrella imports (the invariant was red at the session baseline).
- Full CI run `45395007270` on commit `15861b1b`: Lean build + axiom job and
  semantic/python audit job both **success**.
- Scoped attestation `data/PROOF_ATTESTATION_SCOPED_RNDSURCHARGE.json` binds the
  three committed module blobs to that green run; no `sorry`, `admit` or new axiom
  was introduced.
- Evidence generator accepts the unit only with the CI hash check, an
  independent spec, pinned needles in the *scoped article*, the exact rate
  rational, ≥5 kernel-decided examples and ≥3 genuine boundary categories.
- Measured queue after attestation and ledger reconciliation:
  `FULLY_VERIFIED=718`, `NOT_STARTED=396131`, `PROVED_SCOPE=3`, `BLOCKED=2`.
  The progress ledger records `COUNTED; NOT_STARTED delta -4; new modules 3`
  (three bounded modules landed in this cycle/workstream, of which this unit is
  one). No completion of the article or the law is claimed.

## Status axes (kept separate)

- 技術的検証済み: kernel build, axiom probe, gates and source-correspondence checks
  recorded above for the bounded integer slice.
- 形式化未完了: the unit is a computable-slice model; the article's full normative
  content and the remaining obligations stay unfinished.
- 法的レビュー未完了: `LEGAL_REVIEW_PENDING`; no human approval or review record
  is claimed or fabricated.

No claim of whole-article, whole-law or whole-tax-system completion is made.
