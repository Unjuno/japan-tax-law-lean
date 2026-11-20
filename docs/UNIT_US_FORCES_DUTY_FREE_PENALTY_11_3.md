# Unit review — 在日米軍特例法 art. 11(3) (penalty upper limits)

Normative unit id: `NORM|1db69bb3bef2d77f92573dc1ea87c88c11703d6916e8958a068fe79368cd8c19`
Law: `327AC0000000111`, revision `327AC0000000111_20250601_504AC0000000068`,
enforcement 2025-06-01.
Source: `data/raw/327AC0000000111_20250601_504AC0000000068.law.json`
Provision path: `Law#111/LawBody/MainProvision/Article#11/Paragraph#3`
Article JSON SHA-256 (canonical): `48275e6323866d7c30c9c4efda73eb06e4e64b1488d615092a71f4112af662fe`

Verbatim source (para 3): 「第一項の規定に違反した者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The upper limits are 12 months' imprisonment and ¥500,000 fine, as **alternatives** (「又は」), not concurrent. |
| T (reproduction) | `scripts/ci/transcription_audit.py` needle 「一年以下の拘禁刑又は五十万円以下の罰金に処する」, searched against the article scoped by `第十一条`. |
| D (decision) | PASS — transcription audit 161/161; needle located in MainProvision Article 11 para 3. |
| C (competing interpretation) | A console-decoded draft initially read 「三十万円」 (¥300,000). Re-extraction from the pinned UTF-8 JSON (and the `五十万円` kanji literal) refuted it: ¥500,000. Also note the SAME law has a **Supplementary** Article 11 (transitional measures); it is a different provision and is not the source of this unit. |
| U (uncertainty) | Fidelity, not legal correctness. Whether 「一年以下」 maps exactly to 12 calendar months for sentencing purposes is a legal question; the model records 12 as an upper bound on a Nat month count only. |

## Model and proof scope

- Implementation: `JapanTaxLaw/UsForcesDutyFreePenalty.lean` — `Penalty` inductive (imprisonment | fine), `withinLimits`, constants 12 / 500_000.
- Independent spec: `JapanTaxLaw/UsForcesDutyFreePenaltySpec.lean` — declares its OWN constants (`specMaxMonths`, `specMaxYen`) from the 原文.
- Kernel proof: `specWithin_iff_withinLimits (p : Penalty)` quantifies over **every** penalty value (not a finite enumeration); Lean kernel checked.
- Tests: `JapanTaxLaw/UsForcesDutyFreePenaltyTests.lean` — boundary examples 0/11/12/13 months and 0/499_999/500_000/500_001 yen, all `by decide`.

## Not modelled (retained as unhandled scope)

Paragraph 1 (prohibited transfer of duty-free goods and the cabinet-office approval exception), paragraph 2 (collection by the tax office), paragraph 4 (corporate liability), the Supplementary Article 11 transitional provision, and all judicial sentencing discretion. This is a computable slice of one penalty norm — not an article-level or law-level completion claim. Human legal review remains `LEGAL_REVIEW_PENDING`.

## Verification status

`PROVED_SCOPE` pending the kernel-build attestation for the new module blobs (attestation is produced by CI after merge); mechanical evidence is not back-dated.
