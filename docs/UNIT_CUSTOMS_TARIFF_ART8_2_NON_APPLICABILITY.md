# Unit review — 関税定率法 第八条の二(2)（条件）CONDITION

Normative unit id: `NORM|3f6a79aacce7c6e225e32f8ee0c3a4f20ff56056b93d87ac347341b2ceee1ede`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.
Verbatim source text: 「前項の規定は、次の各号のいずれかに該当する場合には、適用しない。」 — the preceding paragraph's provisions do not apply when a case falls under any enumerated item.

Exact source position: `LawBody[1]/MainProvision/MainProvision[18]/Article:8_2/Article#8_2/Paragraph#2/ParagraphSentence/Sentence#1` — Article 第八条の二 (Num=8_2). `find_article_text(...,"第八条の二")` len 4324 with needle → article-kind locator. Paragraph 2 enumerated items Num 1, Num 2 extracted structurally.

Norm kind: **CONDITION** — non-applicability gate over the two enumerated items.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Listed items (1, 2) disable the preceding paragraph; other cases do not. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt8_2NonApplicability.lean. |
| D | PASS — transcription audit 357/357. |
| C | Only case discrimination modeled; item substance and preceding paragraph out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt8_2NonApplicability.lean` — Case, enumeratedItemCount 2, precedingParagraphApplies.
- Independent spec: `SpecListedCase` disjunction; `agree_non_applicability` axiom-free.
- Build: full lake build success (1153 jobs); all unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Item substance, the preceding paragraph, legal correctness. Computable slice of one CONDITION norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART8_2_NON_APPLICABILITY.md`.
