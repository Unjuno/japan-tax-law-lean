# Unit review — 関税定率法 第七条(31)（期間）REFERENCE

Normative unit id: `NORM|a3c6d65dfb98b73b085f2ef4d01b3ef4243d2c0efc5bc55f46f6fac43405e0ea`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号,
law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「前項の調査は、第二十九項の規定による請求があつた日から一年以内に終了するものとする。」 — the 前項 investigation must be completed 一年以内 (within one year) from the date of a request under 第二十九項.

Exact source position:
`LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/Paragraph#31/ParagraphSentence/Sentence#1` — MainProvision Article 第七条, caption （相殺関税）. `find_article_text(...,"第七条")` returns that article (len 5989) containing the needle → article-kind locator used.

Norm kind: **REFERENCE** — a temporal-application deadline. The computable slice models the one-year deadline: `withinDeadline oneYearDays request completion := completion ≤ request + yearCount * oneYearDays`, with `yearCount=1` derived from the verbatim 一年. The exact calendar-day count of 一年 is NOT MODELLED (abstract `oneYearDays` parameter). All statutory terms/date components extracted structurally from the needle.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | The 前項 investigation ends within one year (inclusive 以内) from the 第二十九項 request date. |
| T | `python scripts/ci/transcription_audit.py` article-kind check 「customs tariff art.7 investigation deadline…↔ CustomsTariffArt7InvestigationDeadline.lean」. Full audit: 319/319 checks passed. |
| D | PASS — audit reports `319/319 checks passed`. |
| C | Only the one-year deadline comparison is modeled. The investigation substance, the request mechanism, and the calendar conversion of 一年 into days are out of scope. |
| U | Transcription fidelity only. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTariffArt7InvestigationDeadline.lean` — yearCount=1 (from 一年), withinDeadline, at_deadline (inclusive 以内), after_deadline (axiom-free Nat.not_succ_le_self).
- Independent spec: `SpecWithinDeadline` contrapositive strict-inequality form (genuinely distinct from impl's ≤ form; critically does NOT add a `completion ≥ request` constraint). `agree_within_deadline` universal axiom-free.
- SPEC DEFECT CORRECTED: initial exists-form spec (`completion = request + d ∧ d ≤ budget`) was NOT equivalent to impl (it added `completion ≥ request` that impl does not assert); Lean build rejected the mismatch; replaced with contrapositive form.
- Build: `lake build` → full build success (1007 jobs); unit build 5 jobs; all 3 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Investigation substance, 第二十九項 request mechanism, calendar conversion of 一年 into days, legal correctness. Computable slice of one REFERENCE norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART7_INVESTIGATION_DEADLINE.md`.
