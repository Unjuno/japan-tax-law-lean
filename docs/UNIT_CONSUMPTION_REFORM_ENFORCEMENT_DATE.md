# Unit review — 消費税抜本改革法 附則第一条（令和二年四月一日施行）

Normative unit id: `NORM|72bedb96918f8630e1e4d2cf714e85d493634f87c4d6f26078b56bc4eeeae491`

Law: 424AC0000000068 (社会保障の安定財源の確保等を図る税制の抜本的な改革を行うための消費税法の一部を改正する等の法律), Act, revision
`424AC0000000068_20250401_506AC0000000046`, snapshot
`data/raw/424AC0000000068_20250401_506AC0000000046.law.json`, sha256
`86ab35fb645863e452014e3d70e0f8a6e00f3c7d0a48569c520499c06dadca64`.

Verbatim source text: 「この法律は、令和二年四月一日から施行する。」 (verbatim-unique).
Kind: **REFERENCE** — enforcement date fixed by a supplementary provision (附則).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This Act takes effect on Reiwa 2, April 1 (令和二年四月一日). |
| T (reproduction) | Durable pin `data/TRANSCRIPTION_PINS/ConsumptionTaxReformEnforcementDateReiwa2.json`: law 424AC0000000068, 附則 第一条, verbatim needle unique. `spec_literals = {2, 4}` verified against 原文 (二 = 2, 四 = 4; 一 structural). |
| D (decision) | PASS — needle located uniquely in the scoped supplementary-provision Article 第一条; date triple (2, 4, 1). |
| C (competing interpretation) | A different era-year, month or day is rejected by kernel-decided examples. |
| U (uncertainty) | Transcription fidelity only. Gregorian conversion and other supplementary articles require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `enforcementEraYear=2`, `enforcementMonth=4`, `enforcementDay=1`; `isEnforcementDate y m d := decide (y==2 && m==4 && d==1)`.
- Independent spec: own constants and successor-shifted equality; universal `agree_enforcement_date` by definitional rfl, axiom-free.
- Tests: 8 kernel-decided examples; 5 boundary categories.

## Not modelled

Gregorian conversion, other supplementary articles and enforcement rules.
Computable slice of one REFERENCE norm in the 附則 layer.

## Adversarial review

See `docs/adversarial/reviews-consumption-reform-enforcement-date.md` (H/T/D/C/U).
No legal correctness claimed; human legal review pending.
