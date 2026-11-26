# Unit review — 税関手続改正政令 附則第一条ただし書（第十三条は公布日施行）

Normative unit id: `NORM|efa09d98292a1de5055d9a7bdf08343c4d14f2f9bf9e64ad90a5bd4ddf492e34`

Law: 420CO0000000210 (電子情報処理組織による税関手続の特例等に関する法律の一部を改正する法律の施行に伴う関係政令の整備及び経過措置に関する政令), CabinetOrder, revision
`420CO0000000210_20081001_000000000000000`, snapshot
`data/raw/420CO0000000210_20081001_000000000000000.law.json`, sha256
`499b4ac13b48680b72086379f1ac73f2db709d43f1db1197e838c10f7fa6aaba`.

Verbatim source text: 「ただし、第十三条の規定は、公布の日から施行する。」 (verbatim-unique).
Kind: **EXCEPTION** — a temporal exception: article 13 takes effect with zero delay from promulgation.
Source layer: 附則 proviso (ただし書).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | Article 13 takes effect on the day of promulgation (zero delay), unlike the general deferred rule. |
| T (reproduction) | Durable pin `data/TRANSCRIPTION_PINS/CustomsItExceptionPromptEffective.json`: law 420CO0000000210, 附則 第一条 proviso, verbatim needle unique. No statutory numeral appears; numeric-literal axis vacuous and recorded as such, not PASS. |
| D (decision) | PASS — needle located uniquely in the scoped supplementary proviso; zero delay modelled and 1/2-day delays rejected. |
| C (competing interpretation) | Treating the proviso as a deferred date would admit nonzero delay; `one_day_false` and `two_days_false` reject that. |
| U (uncertainty) | Transcription fidelity only. Article 13's substantive content, the general deferred rule and other supplementary articles require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `promptDelayDays=0`, `isPromptEffective d := decide (d == 0)`.
- Independent spec: own constant and successor-shifted equality `decide (succ d == 1)`; universal `agree_prompt_delay` by definitional rfl, axiom-free.
- Tests: 6 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

## Not modelled

General deferred-effective rule, article 13 content, other supplementary articles.
Computable slice of one EXCEPTION norm in the 附則 layer.

## Adversarial review

See `docs/adversarial/reviews-customs-it-prompt-effective.md` (H/T/D/C/U).
No legal correctness claimed; human legal review pending.
