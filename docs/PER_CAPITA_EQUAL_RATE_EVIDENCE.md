# Normative unit: 地方税法 art.38 (個人の均等割の標準税率) — evidence record

Status record, not a completion claim.

## Selected unit (SELECT)

- normative_id: `NORM|9090b882bace49ea0dbb6a5727ff30fdf0fee04c11a037c87261bd947462e9ce`
- law/revision: `325AC0000000226` / `325AC0000000226_20261101_508AC0000000002`
- enforcement: 2026-11-01; snapshot SHA-256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`
- source path: `LawBody[2]/MainProvision/MainProvision[1]/Article:38/Article#38/Paragraph#1/ParagraphSentence/Sentence#1`
- verbatim unit: 「個人の均等割の標準税率は、千円とする。」
- kind: EFFECT; dependencies: none; unhandled_conditions: none; coverage: exact/COVERED.
- Selection reason: dependency-ready, short computable slice, not covered by any
  existing attested module or open PR.

## Spec / implementation / proof

- `JapanTaxLaw/PerCapitaEqualRate.lean`: `standardRate = 1_000`, `standardCharge n = n * 1_000`.
- `JapanTaxLaw/PerCapitaEqualRateSpec.lean`: independent `specRateYen = 1000`,
  `specChargeYen n = 1000 * n` (commuted form), finite-grid `agree*`.
- `JapanTaxLaw/PerCapitaEqualRateTests.lean`: 11 kernel-decided examples,
  boundaries 0/1/11/12/13.
- No `sorry` / `admit` / `axiom` / `Classical.choice` (checked by
  `scripts/ci/check_no_sorry.py`).

## Independent checks outside Lean

- `scripts/ci/transcription_audit.py`: new pinned needle; audit passes 160/160.
- `docs/ADVERSARIAL_REVIEW.md` Batch AH: independent re-extraction of the pinned
  JSON article, H/T/D/C/U recorded, 0 CONFIRMED / 1 BY-DESIGN / 2 UNRESOLVED.
- `scripts/ci/generate_per_capita_evidence.py`: binds evidence to hash-checked
  CI attestation; with no attestation it produces **no** evidence (verified).

## Not claimed

Scope is one normative unit of one article; 条例変更, reduced/exempt classes,
assessment and 附則 are NOT MODELLED. Human legal review remains
`LEGAL_REVIEW_PENDING`. No claim of whole-article or law-level completion.
