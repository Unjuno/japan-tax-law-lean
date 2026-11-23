# Unit review — 関税定率法 第二十条（ArticleCaption）CONDITION

Normative unit id: `NORM|6c30cf8dbebe8cce20c0fcc0c11f69394a2c8dab5b47cd3d1c36c2b6fa7d4e1b`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.

Verbatim source text: 「（違約品等の再輸出又は廃棄の場合の戻し税等）」 (needle injected from the queue) — a disjunctive case (再輸出 又は 廃棄) for 違約品等 with the listed 戻し税等. Sub-terms are extracted programmatically from the caption. NOTE: a caption is a heading, NOT the operative provisions — drawback mechanics, the definition of 違約品等 and legal effect are NOT MODELLED.

Exact source position: `LawBody[1]/MainProvision/MainProvision[35]/Article:20/Article#20/ArticleCaption` — the needle IS the ArticleCaption. `find_article_text(...,"第二十条")` len 1487 with needle.

Norm kind: **CONDITION** — caption-level disjunctive-case discrimination.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Either listed case (re-export or disposal) is within the caption condition; other cases are not. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt20ContrabandDisposalCondition.lean. |
| D | PASS — transcription audit 452/452. |
| C | Only caption-level disjunctive-case discrimination modeled; operative text and 等 extensions out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt20ContrabandDisposalCondition.lean` — `GoodsCase` (reexport/disposal/other), Bool `withinCondition`, boundary theorems.
- Independent spec: `SpecWithinCondition` Prop disjunction, representationally distinct from the Bool function; `agree_within_condition` axiom-free (cases/rfl, no decide/simp/propext).
- Build: full lake build success (1381 jobs); all four unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Operative article text, drawback mechanics, 等 ("etc.") extensions, legal correctness.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART20_CONTRABAND_DISPOSAL_CONDITION.md`.
