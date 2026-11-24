# Unit review — 災害被害者租税減免法施行政令 第十五条の六 REFERENCE (cross-law)

Normative unit id: `NORM|bf32b450dd578f2d29c8f6300ab9b5391a68134bb72afe9d30dd84a9314e8ce1`

Law: 322CO0000000268 (災害被害者に対する租税の減免、徴収猶予等に関する法律の施行に関する政令), CabinetOrder. SHA-256 f6fe1c93…f5f4e7ef.

Verbatim source text (injected from the queue, not hand-typed): 「自動車重量税法第七条第二項第一号に規定する乗用自動車」

Exact source position: `LawBody[1]/MainProvision/MainProvision[21]/Article:15_6/Article#15_6/Paragraph#2/Item#4/Subitem1#1/Subitem1Sentence/Column#1/Sentence#1` — Column#1 of a subitem.

Norm kind: **REFERENCE** — a cross-law definitional reference: 乗用自動車 (passenger automobile) as prescribed in 自動車重量税法 第七条第二項第一号. The queue resolves the law identity beyond the 15-digit id: law_name=自動車重量税法, law_id=346AC0000000089, article=第七条 (the article prefix of the fuller needle citation), enforcement_version=2022-04-01, resolution=resolved_by_name, sufficient=true. All terms and dependency fields derived programmatically from the authoritative queue; no hand-typed CJK.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The reference resolves to law 自動車重量税法 (id 346AC0000000089), article 第七条, enforcement version 2022-04-01. |
| T | `scripts/ci/transcription_audit.py` article-kind check for DisasterTaxReliefOrderArt15_6PassengerCarReference.lean. |
| D | PASS — transcription audit 586/586. |
| C | Only the resolved reference identity is modeled. The substantive definition in the external law, the Column#2 content, and legal correctness are out of scope. No external-law Lean constant is imported. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/DisasterTaxReliefOrderArt15_6PassengerCarReference.lean` — `CrossLawRef` String-field structure with `definitionReference` and four field theorems.
- Independent spec: `SpecResolvedRef` Prop conjunction, representationally distinct; `implementation_satisfies_spec` axiom-free (And.intro/rfl).
- Build: full lake build success (1930 jobs); all five unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
External-law substantive definition, Column#2 content, legal correctness — all NOT MODELLED.

## Dependencies (resolved beyond 15-digit id — objective §1.6)
type=law_article, law_name=自動車重量税法, law_id=346AC0000000089, article=第七条, enforcement_version=2022-04-01, resolution=resolved_by_name, sufficient=true. The kernel model records this identity as String fields; no external-law Lean constant is imported.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_DISASTER_TAX_RELIEF_ORDER_ART15_6_PASSENGER_CAR_REFERENCE.md`.
