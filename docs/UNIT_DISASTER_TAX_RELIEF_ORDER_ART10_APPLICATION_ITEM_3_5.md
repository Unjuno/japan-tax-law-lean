# Unit review — 災害被害者租税減免法施行令 第十条(1) 第2号 EFFECT

Normative unit id: `NORM|89782d86b1c41898c6684fa9644bde155cf5722491c2e2a5a743f27654b89cc5`

Law: 322CO0000000268 (災害被害者租税減免法施行令), **CabinetOrder (政令)**.

Verbatim source text: 「法第三条第五項の規定の適用を受けようとする旨」 — one listed item of an application: the applicant states the purport of seeking application of Act art.3(5). Needle injected from the queue; reference coordinates 3/5 extracted structurally.

Exact source position: `LawBody[1]/MainProvision/MainProvision[10]/Article:10/Article#10/Paragraph#1/Item#2/ItemSentence/Sentence#1`.

Norm kind: **EFFECT** — listed-item requirement with cross-law reference coordinates.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The stated purport of seeking art.3(5) application is a required listed item. |
| T | `scripts/ci/transcription_audit.py` article-kind check for DisasterTaxReliefOrderArt10ApplicationItem3_5.lean. |
| D | PASS — transcription audit 463/463. |
| C | Only listed-item discrimination and reference coordinates modeled; application procedure out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/DisasterTaxReliefOrderArt10ApplicationItem3_5.lean` — `ApplicationItem` (actArt3Para5Intent/other), `isRequiredItem`, `refArticle=3`, `refParagraph=5`.
- Independent spec: `SpecEffect` Prop conjunction, representationally distinct; `implementation_satisfies_spec` axiom-free (`And.intro`/rfl).
- Build: full lake build success (1516 jobs); all four unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Dependencies
The queue records one `law_article` dependency (法第三条) as `unresolved_underdetermined` / `sufficient=false`, recorded honestly.

## Not modelled
Application procedure, other listed items, legal correctness.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_DISASTER_TAX_RELIEF_ORDER_ART10_APPLICATION_ITEM_3_5.md`.
