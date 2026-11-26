# Unit review — 米軍地位協定国税臨時特例法 附則第一条（令和八年四月一日施行）

Normative unit id: `NORM|b5137b6e0cf7a11197d82dd9d52fe925860b459cc31e1a7119ffd4cbf270c61b`

Law: 327AC0000000113 (日本国とアメリカ合衆国との間の相互協力及び安全保障条約第六条に基づく施設及び区域並びに日本国における合衆国軍隊の地位に関する協定の実施に伴う国税通則法等の臨時特例に関する法律), Act, revision
`327AC0000000113_20260401_508AC0000000012`, snapshot
`data/raw/327AC0000000113_20260401_508AC0000000012.law.json`, sha256
`bb30245b6c74180d4f0f4b4187dc07d41893717bed1506bf82cb545adac8434a`.

Verbatim source text: 「この法律は、令和八年四月一日から施行する。」 (verbatim-unique).
Kind: **REFERENCE** — the enforcement date fixed by a supplementary provision (附則).
Source layer: 附則 (supplementary provision), not 本則.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This Act takes effect on Reiwa 8, April 1 (令和八年四月一日). |
| T (reproduction) | Durable pin `data/TRANSCRIPTION_PINS/UsForcesTreatyEnforcementDateReiwa8.json`: law 327AC0000000113, 附則 第一条, verbatim needle unique. `spec_literals = {8, 4}` verified against 原文 (八 = 8, 四 = 4; 一 is structural). |
| D (decision) | PASS — needle located uniquely in the scoped supplementary-provision Article 第一条; date triple pinned as (8, 4, 1). |
| C (competing interpretation) | A different era-year, month or day is rejected by kernel-decided examples (`wrong_year_false`, `wrong_day_false`, plus month case in Tests). |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Gregorian conversion and other supplementary articles require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `enforcementEraYear=8`, `enforcementMonth=4`, `enforcementDay=1`; `isEnforcementDate y m d := decide (y==8 && m==4 && d==1)`.
- Independent spec: own constants and successor-shifted equality `decide (succ y == succ 8 && succ m == succ 4 && succ d == succ 1)`; universal `agree_enforcement_date` by definitional rfl, axiom-free.
- Tests: 8 kernel-decided examples; 5 boundary categories.

## Not modelled

Gregorian conversion, other supplementary articles and enforcement rules.
This is a computable slice of one REFERENCE norm unit in the 附則 layer.

## Adversarial review

See `docs/adversarial/reviews-us-forces-enforcement-date.md` (H/T/D/C/U per check).
No legal correctness claimed; human legal review pending.
