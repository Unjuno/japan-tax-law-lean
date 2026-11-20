# Unit review — 航空機燃料税法 art. 11 (¥26,000 per kilolitre)

Normative unit id: `NORM|99061309435f403e991be4370b1f7f7970c0769f7b3d705d98e00de8673ed91b`

Law: 347AC0000000007 (航空機燃料税法), revision
`347AC0000000007_20250601_504AC0000000068`, enforcement 2025-06-01,
snapshot `data/raw/347AC0000000007_20250601_504AC0000000068.law.json`,
sha256 `de83a01b558cca9d07af779b71416c9d15d5e62ecabfefcb00eb9e1cd18dbbde`
(inventory records the same digest in upper case; comparison is case-insensitive).

Verbatim source text: 「航空機燃料税の税率は、航空機燃料一キロリットルにつき二万六千円とする。」

Exact source position (from the generated queue):
`LawBody[2]/MainProvision/MainProvision[1]/Article:11/Article#11/Paragraph#1/ParagraphSentence/Sentence#1`.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The model constant is ¥26,000 and is charged per kilolitre of aviation fuel (航空機燃料一キロリットルにつき). The computed function `k × 26,000` is linear in the caller-supplied quantity; 課税標準 determination is out of scope. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` check 「航空機燃料税法 art. 11（税率: 一キロリットルにつき二万六千円）」 pinned to law 347AC0000000007, article locator 第十一条, needle 「航空機燃料税の税率は、航空機燃料一キロリットルにつき二万六千円とする」. Independent full-file walk: needle occurs **once**, numeral 「二万六千円」 occurs **once**, both in 第十一条. |
| D (decision) | PASS — needle found in the pinned article; audit reports `162/162 checks passed`. |
| C (competing interpretation) | 「二万六千円」 could occur in a different law's fee schedule; a repo-wide numeric match would mislocate the constant. Within this pin it is unique, but the unit is pinned by law id + revision + 第十一条 + structural path + source digest, not by the number alone. Other provisions of this Act (第八条 非課税, 第十条 課税標準, 第十四条 / 第十五条 申告・納付, 附則 経過措置) are distinct norms and are NOT modelled. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. The determination of 第十条 課税標準, 第八条 非課税, 第十四条 / 第十五条 申告・納付 procedure and 附則 経過措置 are out of scope. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/AviationFuelTaxRate.lean` — `ratePerKilolitre : Money := 26_000`,
  `taxForKilolitres k = k * ratePerKilolitre`.
- Independent spec: `JapanTaxLaw/AviationFuelTaxRateSpec.lean` — `specSum` is
  primitive-recursive repeated addition of ¥26,000, a deliberately different
  formulation from the implementation's multiplication.
- Kernel proof: `agree_aviation_fuel_tax` proves equality for **all** `Nat`
  quantities by induction (no finite enumeration); plus `specSum_zero`,
  `specSum_pos_of_pos`, `taxForKilolitres_mono`, `rate_not_scaled` (rejects
  ten-fold transcription errors) and kernel-decided boundary examples.
- Build: `lake build` → **533 jobs, completed successfully**. No `sorry`/`admit`/`axiom`.
- Axiom probe: `agree_aviation_fuel_tax` depends on `propext` only; the other
  four theorems depend on no axioms; **no `sorryAx`, no `Classical.choice`**.
- Tests: `JapanTaxLaw/AviationFuelTaxRateTests.lean` — 0, 1, 2, 3, 100 kL, all
  kernel-decided.
- Scope registration: `scripts/ci/spec_scope_map.py` → 100 modules,
  510/1433 units explicitly in scope.

## Not modelled (explicitly retained as unhandled scope)

第八条 非課税, 第十条 課税標準, 第十四条 / 第十五条 申告・納付, 附則 経過措置.
This is a computable slice of one norm unit, not an article-level or law-level
completion claim. Human legal review is pending.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_AVIATION_FUEL_TAX_RATE_11.md` (H/T/D/C/U per finding).
