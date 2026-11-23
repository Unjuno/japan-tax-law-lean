# Unit review — 関税定率法 第十九条(8)（準用）READING

Normative unit id: `NORM|a0184c1fc0cb64c644aa5ef470ba11907d10add61cb7dfb49ce9901bd8f88e68`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.

Verbatim source text: 「前項の規定は、第五項又は第六項の規定を適用する場合について準用する。」 — a READING (準用): the immediately preceding paragraph's provisions are read in when either 第五項 or 第六項 provisions apply — a disjunctive trigger. Sub-terms (前項 / 第五項 / 第六項) and paragraph numbers (5, 6) are extracted programmatically from the needle, never hand-typed.

Exact source position: `LawBody[1]/MainProvision/MainProvision[32]/Article:19/Article#19/Paragraph#8/ParagraphSentence/Sentence#1` — Article 第十九条. `find_article_text(...,"第十九条")` len 2200 with needle → article-kind locator.

Norm kind: **READING** — 準用 with a disjunctive trigger (第五項 又は 第六項).

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The 前項 provisions are read in iff 第五項 or 第六項 applies; not otherwise. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt19PrevPara5Or6Reading.lean. |
| D | PASS — transcription audit 431/431. |
| C | Only the cross-reference structure and disjunctive trigger modeled; substantive content out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt19PrevPara5Or6Reading.lean` — `Provision` (prevParagraph), `Trigger` (para5/para6/other), Prop-valued `appliesViaReading` (disjunction), `sourceParagraphOffset=1`, `triggerParaA=5`, `triggerParaB=6`.
- Independent spec: `SpecAppliesBool` Bool function (true only for the two triggers), representationally distinct from the Prop disjunction; `agree_applies` axiom-free (cases/rfl/intro/rcases, no decide/simp/propext).
- Build: full lake build success (1327 jobs); all six unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Substantive content of 前項 / 第五項 / 第六項, trigger establishment, other reading rules, legal correctness. Computable slice of one READING norm unit.

## Development failure record
Two `lake build` attempts failed with `Tactic 'left' failed` in `applies_for_para6` and the spec's reverse direction (`right; left; rfl`). Cause: after `right`, the goal is an equality (`Trigger.para6 = Trigger.para6`), not a disjunction, so `left` is inapplicable. Hypotheses considered: (a) wrong disjunct selected; (b) `right` did not close the disjunction. Resolved by (b): replaced `right; left; rfl` with `right; rfl` in both sites; rebuilt successfully (1327 jobs, 0 errors). No gate was weakened.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART19_PREV_PARA5_OR6_READING.md`.
