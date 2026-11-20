# Normative unit — 相続税法 art. 21の11の二(1) / GiftAnnualExemption (2026-11-20)

## Target selection (SELECT)
`python scripts/ci/task_selector.py` → dependency-ready, unowned unit:

- `NORM|55e13519abd6d766aecf93ee9290185b902fa9d53a6de2dfdab9f7e8fd508781`
- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  enforced 2026-04-01, article `21_11_2`, kind `EFFECT`
- dependencies `[]`, `unhandled_conditions []`, coverage `COVERED` (exact, unique ids), status `NOT_STARTED`

## SOURCE (measured)
Pinned raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`
sha256 `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`.

Scoped article (190 chars, independently re-extracted):

```
（相続時精算課税に係る贈与税の基礎控除）第二十一条の十一の二相続時精算課税適用者がその年中において特定贈与者からの贈与により取得した財産に係るその年分の贈与税については、贈与税の課税価格から六十万円を控除する。２前項の相続時精算課税適用者に係る特定贈与者が二人以上ある場合における各特定贈与者から贈与により取得した財産に係る課税価格から控除する金額の計算については、政令で定める。
```

Exact source path: `LawBody[3]/MainProvision/MainProvision[1]/Article:21_11_2/Article#21_11_2/Paragraph#1/ParagraphSentence/Sentence#1`.

## FORMALIZE / PROVE (measured)
- `JapanTaxLaw/GiftAnnualExemption.lean` — `giftAnnualExemptionLimit = 600_000`,
  `giftAnnualExemptionBase price = price − 600_000` (Nat saturating), 3 kernel theorems.
- `JapanTaxLaw/GiftAnnualExemptionSpec.lean` — independent `specGiftAnnualExemptionBase`
  using an inline literal and explicit `if`; no implementation definition in its
  definitional section (`independent_spec_ok` = true).
- `JapanTaxLaw/GiftAnnualExemptionTests.lean` — 9 kernel-decided examples incl. boundaries
  0, 1, 599999, 600000, 600001, 611012, 1200000, 13000000.
- Local `lake build` (Lean 4.35.0): **527 jobs, exit 0**. `check_no_sorry.py`: no forbidden placeholders.
- `python scripts/ci/transcription_audit.py` → **160/160 PASS** incl. the new anchor.

## ADVERSARIAL (H/T/D/C/U)
Module-specific section `### GiftAnnualExemption.lean` in `docs/ADVERSARIAL_REVIEW.md`:
independent re-extraction from the pinned JSON, competing interpretation (addition
instead of subtraction) rejected by the verbatim 「控除する」, paragraph 2 (政令委任)
recorded as NOT MODELLED, no circular spec.

## CI ATTESTATION (measured, real)
Workflow `Lean & Audit verification`, run
https://github.com/Unjuno/japan-tax-law-lean/actions/runs/44714066256
(workflow_dispatch, commit `71a2b7c46b37d50126c2e8ac814e338548b927cb`):
**conclusion = success**. Both jobs success; the Lean job's required steps
(`Build explicitly`, `No sorry/admit in adopted proofs`, `Axioms of key theorems`,
two clean-build reproducibility checks) all succeeded.

`data/PROOF_ATTESTATION.json` is bound to that run (459 module blob hashes from the
CI-built commit). `data/verification_evidence.json` now contains all **11 evidence
axes** for the target unit, including the CI run id as `kernel_proof`.

## Measured effect (real, not simulated)
```
BEFORE {'NOT_STARTED': 396843, 'PROVED_SCOPE': 1, 'FULLY_VERIFIED': 8, 'BLOCKED': 2}
AFTER  {'NOT_STARTED': 396842, 'PROVED_SCOPE': 1, 'FULLY_VERIFIED': 9, 'BLOCKED': 2}
DELTA  NOT_STARTED -1, FULLY_VERIFIED +1
verify_queue_invariants.py: 12/12 PASS
  PASS every FULLY_VERIFIED is evidence-backed - FULLY_VERIFIED=9 axes=11 unbacked=0
```
Local Python gates on the final branch: **36 PASS / 0 FAIL / 0 SKIP**.

## Scope limits
Paragraph 2 (two-or-more specific donors; cabinet order) is NOT MODELLED.
Applicability conditions are caller-established. No whole-article completion claim.
Human legal review remains pending (separate axis).

## Resumption
Branch `feat/norm-unit-tobacco-grant-2026`, PR **#232** (open).
Subsequent commits after the attested commit only refresh generated ledgers;
re-run `python scripts/ci/run_python_gates.py` and a CI dispatch to reconfirm.
