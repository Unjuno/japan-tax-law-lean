# Unit review — 災害被害者租税減免法 第三条(1)（準用）READING

Normative unit id: `NORM|cc418cedeeb1fc09da3ff8faf6c482785b2381b98026b29f92bbfb80f53e3cf1`

Law: 322AC0000000175 (災害被害者に対する租税の減免、徴収猶予等に関する法律), Act. Raw SHA-256 `c3bb5b0b…f4e7ef` (distinct from the customs-tariff law).

Verbatim source text: 「この場合においては、同法第百十二条から第百十四条までの規定を準用する。」 — in the trigger case この場合, Articles 112–114 of the same Act are read in mutatis mutandis. The article range is extracted programmatically from the needle's kanji numerals.

Exact source position: `LawBody[1]/MainProvision/MainProvision[2]/Article:3/Article#3/Paragraph#1/ParagraphSentence/Sentence#2` — article len 2285 with needle.

Norm kind: **READING** — cross-article range 準用 with trigger-case discrimination.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Articles 112–114 apply in the この場合 case; not otherwise. |
| T | `scripts/ci/transcription_audit.py` article-kind check for DisasterTaxReliefArt3ArticleRangeReading.lean. |
| D | PASS — transcription audit 463/463. |
| C | Only the article-range reference and trigger-case discrimination modeled; substantive content out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/DisasterTaxReliefArt3ArticleRangeReading.lean` — `TriggerCase` (thisCase/other), `appliesViaReading`, `sourceArticleLo=112`, `sourceArticleHi=114`.
- Independent spec: `SpecReading` Prop conjunction, representationally distinct; `implementation_satisfies_spec` axiom-free (unfold + `⟨rfl,…⟩`).
- Build: full lake build success (1429 jobs); all four unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Dependencies
The queue records two `law_article` dependencies (第百十二条, 第百十四条) as `unresolved_underdetermined` / `sufficient=false`, recorded honestly; no cross-law constant claimed.

## Not modelled
Substantive content of Articles 112–114, establishment of この場合, legal correctness.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_DISASTER_TAX_RELIEF_ART3_ARTICLE_RANGE_READING.md`.
