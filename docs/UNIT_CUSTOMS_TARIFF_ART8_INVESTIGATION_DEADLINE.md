# Unit review — 関税定率法 第八条(34)（期間）REFERENCE

Normative unit id: `NORM|8e7f2e7760ab18115472d1df642a2e1050aed907df6e99450a2bfef59a875a11`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号,
law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「前項の調査は、第三十二項の規定による請求があつた日から一年以内に終了するものとする。」 — the 前項 investigation must be completed 一年以内 (within one year) from the date of a request under 第三十二項.

Exact source position:
`LawBody[1]/MainProvision/MainProvision[17]/Article:8/Article#8/Paragraph#34/ParagraphSentence/Sentence#1` — MainProvision Article 第八条. `find_article_text(...,"第八条")` returns that article (len 6919) containing the needle → article-kind locator used.

Norm kind: **REFERENCE** — a temporal-application deadline. The computable slice models the one-year deadline comparison with yearCount=1 derived structurally from the verbatim 一年. The exact calendar-day count of 一年 is NOT MODELLED (abstract oneYearDays parameter).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | The 前項 investigation ends within one year (inclusive 以内) from the 第三十二項 request date. |
| T | `python scripts/ci/transcription_audit.py` article-kind check 「customs tariff art.8 investigation deadline…↔ CustomsTariffArt8InvestigationDeadline.lean」. Full audit: 341/341 checks passed. |
| D | PASS — audit reports `341/341 checks passed`. |
| C | Only the one-year deadline comparison is modeled. The investigation substance, the request mechanism, and calendar conversion are out of scope. |
| U | Transcription fidelity only. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTariffArt8InvestigationDeadline.lean` — yearCount=1 (from verbatim 一年), withinDeadline (≤ form), at_deadline (inclusive 以内 via Nat.le_refl), after_deadline (axiom-free Nat.not_succ_le_self).
- Independent spec: `SpecWithinDeadline` contrapositive strict-inequality form, equivalent for all Nat; `agree_within_deadline` axiom-free via Nat.not_lt_of_ge/Nat.le_of_not_gt.
- Build: `lake build` → full build success (1073 jobs); unit build 5 jobs; all three theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Investigation substance, 第三十二項 request mechanism, calendar conversion of 一年 into days, and legal correctness. Computable slice of one REFERENCE norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART8_INVESTIGATION_DEADLINE.md`.
