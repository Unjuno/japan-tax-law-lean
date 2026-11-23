# Unit review — 災害被害者租税減免法施行令 第六条(1)（準用）READING

Normative unit id: `NORM|d5894392c229474ffbca28c6632b178fecd3bfa7d5e949295bfb5945618024bf`

Law: 322CO0000000268 (昭和二十二年政令第二百六十八号 — 災害被害者に対する租税の減免、徴収猶予等に関する法律の施行に関する政令), **CabinetOrder (政令)**, SHA-256 `f6fe1c93…66a21c`. This is a Cabinet Order implementing the disaster tax relief Act — a different law type from prior units.

Verbatim source text: 「前二条の規定は、第三条の二第四項の場合について、これを準用する。」 — the two preceding articles (relative to article 6 → articles 4 and 5) are read in for the case of Article 3-2 paragraph 4. Source range and trigger extracted programmatically from the needle and source path.

Exact source position: `LawBody[1]/MainProvision/MainProvision[6]/Article:6/Article#6/Paragraph#1/ParagraphSentence/Sentence#1` — article len 206 with needle.

Norm kind: **READING** — cross-article range 準用 with trigger-case discrimination.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Articles 4–5 apply in the 第三条の二第四項 case; not otherwise. |
| T | `scripts/ci/transcription_audit.py` article-kind check for DisasterTaxReliefOrderArt6PrecedingTwoReading.lean. |
| D | PASS — transcription audit 466/466. |
| C | Only article-range reference and trigger-case discrimination modeled; substantive content out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/DisasterTaxReliefOrderArt6PrecedingTwoReading.lean` — `TriggerCase` (targetCase/other), `appliesViaReading`, `sourceArticleLo=4`, `sourceArticleHi=5`.
- Independent spec: `SpecReading` Prop conjunction, representationally distinct; `implementation_satisfies_spec` axiom-free (unfold + `⟨rfl,…⟩`).
- Build: full lake build success (1438 jobs); all four unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Dependencies
The queue records one `law_article` dependency as `unresolved_underdetermined` / `sufficient=false`, recorded honestly; no cross-law constant claimed.

## Not modelled
Substantive content of Articles 4/5 and 第三条の二第四項, trigger establishment, legal correctness.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_DISASTER_TAX_RELIEF_ORDER_ART6_PRECEDING_TWO_READING.md`.
