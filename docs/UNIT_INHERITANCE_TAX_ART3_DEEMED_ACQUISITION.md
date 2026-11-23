# Unit review — 相続税法 第三条（ArticleCaption）DEEMING

Normative unit id: `NORM|6a574541c0cc8e189b22ac97d2c2ddacaa3a00871afe9a7f5c9ca2137f72dc74`

Law: 325AC0000000073 (相続税法), Act, revision `325AC0000000073_20260401_506AC0000000008`.

Verbatim source text: 「（相続又は遺贈により取得したものとみなす場合）」 — the article caption (見出し) of 第三条, labeling cases deemed to be acquisitions by inheritance or legacy. Needle injected from the queue; sub-terms 相続/遺贈 extracted structurally.

Exact source position: `LawBody[3]/MainProvision/MainProvision[0]/Article:3/Article#3/ArticleCaption` — the needle IS the ArticleCaption. `find_article_text(...,"第三条")` len 1959 with needle.

Norm kind: **DEEMING** — a new norm kind at the caption level (queue `kinds=['DEEMING','CONDITION']`, primary kind DEEMING).

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Both inheritance and legacy are deemed acquisition cases; other modes are not. |
| T | `scripts/ci/transcription_audit.py` article-kind check for InheritanceTaxArt3DeemedAcquisition.lean. |
| D | PASS — transcription audit 467/467. |
| C | Only caption-level disjunctive-mode discrimination modeled; operative deeming rules out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/InheritanceTaxArt3DeemedAcquisition.lean` — `AcquisitionMode` (inheritance/legacy/other), Bool `isDeemed` (inclusive OR), boundary theorems.
- Independent spec: `SpecDeemed` Prop disjunction, representationally distinct; `agree_is_deemed` axiom-free (cases/rfl).
- Build: full lake build success (1525 jobs); all four unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Operative deeming provisions, legal correctness.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_TAX_ART3_DEEMED_ACQUISITION.md`.
