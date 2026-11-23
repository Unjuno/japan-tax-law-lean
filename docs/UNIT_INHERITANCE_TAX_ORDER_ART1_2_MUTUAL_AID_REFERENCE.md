# Unit review — 相続税法施行令 第一条の二 第3号 ロ(6) REFERENCE

Normative unit id: `NORM|11f7f4673dcaa2422142b0f75a5bb0310325bee78dc770b7857dd592bb56d975`

Law: 325CO0000000071 (相続税法施行令, 昭和二十五年政令第七十一号), **CabinetOrder (政令)**. SHA-256 `d1addeab…9f04`.

Verbatim source text: 「法第十二条第一項第五号に規定する共済制度に係る契約」 — a definition-by-reference to the mutual aid system prescribed in Act art.12(1)5. Needle injected from the queue; reference coordinates 12/1/5 extracted structurally.

Exact source position: `LawBody[3]/MainProvision/MainProvision[0]/Article:1_2/Article#1_2/Paragraph#1/Item#3/Subitem1#6/Subitem1Sentence/Sentence#1`.

Norm kind: **REFERENCE** — cross-law coordinate reference with act-prescribed discrimination.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The relevant contracts relate to the act-prescribed mutual aid system (art.12(1)5). |
| T | `scripts/ci/transcription_audit.py` article-kind check for InheritanceTaxOrderArt1_2MutualAidContractReference.lean. |
| D | PASS — transcription audit 462/462. |
| C | Only reference coordinates and act-prescribed discrimination modeled; system content out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/InheritanceTaxOrderArt1_2MutualAidContractReference.lean` — `MutualAidSystem` (actPrescribed/other), `isActPrescribed`, `refArticle=12/refParagraph=1/refItem=5`.
- Independent spec: `SpecReference` Prop conjunction, representationally distinct; `implementation_satisfies_spec` axiom-free (`And.intro`/rfl).
- Build: full lake build success (1498 jobs); all four unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Dependencies
The queue records one `law_article` dependency (法第十二条) as `unresolved_underdetermined` / `sufficient=false`, recorded honestly; no bare ID treated as resolved.

## Not modelled
Referenced system content, contract terms, legal correctness.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_TAX_ORDER_ART1_2_MUTUAL_AID_REFERENCE.md`.
