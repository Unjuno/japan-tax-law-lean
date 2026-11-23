# Unit review — 関税定率法 第十九条の三（ArticleCaption）CONDITION

Normative unit id: `NORM|760c6bfcb0b3bc22f09624b5e53c32fb918c0b6587084cfe8b2fa44a7185b523`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.

Verbatim source text: the article caption 「（輸入時と同一状態で再輸出される場合の戻し税等）」 (needle injected from the queue, never hand-typed). This unit is the **article caption** (見出し) of 第十九条の三, labeling a CONDITION (re-export in the same state as at import) and a listed relief (戻し税 等). Sub-terms are extracted structurally from the caption. NOTE: a caption is a heading, NOT the operative provisions — substantive re-export requirements, relief mechanics and 等 extensions are NOT MODELLED.

Exact source position: `LawBody[1]/MainProvision/MainProvision[34]/Article:19_3/Article#19_3/ArticleCaption` — the needle IS the ArticleCaption. `find_article_text(...,"第十九条の三")` len 783 with needle.

Norm kind: **CONDITION** — caption-level case/relief discrimination.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The re-export-in-same-state case with the listed relief is within the caption condition; others are not. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt19_3ReexportSameStateCondition.lean. |
| D | PASS — transcription audit 439/439. |
| C | Only caption-level case/relief discrimination modeled; operative text and 等 extensions out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt19_3ReexportSameStateCondition.lean` — `ExportCase` (reexportSameState/other), `Relief` (drawback/otherRelief), Bool `withinCondition` (nested match), boundary theorems.
- Independent spec: `SpecWithinCondition` Prop predicate, representationally distinct from the Bool function; `agree_within_condition` axiom-free (cases/rfl, no decide/simp/propext).
- Build: full lake build success (1348 jobs); all four unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Development note
Nested `match` is used throughout (rather than multi-pattern match) to keep theorems axiom-free — a prior unit isolated a `propext` dependency from a multi-pattern match with a stale `.olean`.

## Not modelled
Operative article text, re-export mechanics, 等 ("etc.") extensions, legal correctness.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART19_3_REEXPORT_CONDITION.md`.
