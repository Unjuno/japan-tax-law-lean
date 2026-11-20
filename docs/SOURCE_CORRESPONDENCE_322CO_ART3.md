# Source correspondence — 昭和二十二年政令第百九号 art. 3 (independent of Lean)

Rule: an original-text correspondence decision, not a proof and not a legal-correctness claim.

- Normative unit: `NORM|368f77444888dd8e28bda37fa5deb1bae1d03502d1f8c036d2975e32fd768f5e`
- Law: `322CO0000000109`, revision `322CO0000000109_19470627_000000000000000`, enforcement 1947-06-27
- Pinned source: `data/raw/322CO0000000109_19470627_000000000000000.law.json`
- Source SHA-256: `9ff39f03e58b315d04fbb65246dd5a4e64cf8c6a428eae84c53bb49c530816ec`
- Structural path: `LawBody[1]/MainProvision/MainProvision[2]/Article:3/Article#3/Paragraph#1/ParagraphSentence/Sentence`
- Normative kind: `CONDITION`

| 記号 | 内容 |
|---|---|
| H（反証可能仮説） | The queue unit's normative fragment is not the verbatim text of the stated article in the pinned source. |
| T（再現検査） | Load the pinned raw JSON independently of the decomposer, locate `Article` with `attr.Num == "3"`, flatten `children`, whitespace-normalise, and test substring containment of the unit fragment. |
| D（合否） | **PASS** — `verbatim in scoped article: True`; the whole article is 90 normalised characters and the unit fragment equals the article sentence. |
| C（対立解釈） | The same words could occur in a neighbouring article; the check therefore scopes to `Article:3`, not the whole law text. No competing article matched for this fragment. |
| U（不確かさ） | This establishes transcription fidelity only. Whether the condition's legal effect is correctly modelled, whether exceptions in other articles interact, and whether the 1947 revision is the applicable version for a given question date remain unverified. |

## Not claimed
No Lean kernel proof, no `FULLY_VERIFIED` promotion, no human legal review. `LEGAL_REVIEW_PENDING` is retained.
