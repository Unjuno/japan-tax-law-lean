# Unit review — 災害被害者租税減免法 第九条(2) 第三号 REFERENCE (cross-law)

Normative unit id: `NORM|5bbe8f54b0c419b7fc98b824f274be232c9427117dac9d087a1d1e143eea7575`

Law: 322AC0000000175 (災害被害者に対する租税の減免、徴収猶予等に関する法律), Act. SHA-256 c3bb5b0b…f5f4e7ef.

Verbatim source text (injected from the queue, not hand-typed): 「自動車重量税法第二条第一項第三号に規定する車両番号の指定をいう。」

Exact source position: `LawBody[1]/MainProvision/MainProvision[8]/Article:9/Article#9/Paragraph#2/Item#3/ItemSentence/Column#2/Sentence#1` — the whole Column#2 sentence; Item#3's Column#1 is a separate norm (NOT MODELLED here).

Norm kind: **REFERENCE** — a cross-law definitional reference: 車両番号の指定 (the vehicle number designation) means that prescribed in 自動車重量税法 第二条第一項第三号. The queue resolves this dependency beyond the 15-digit law id: law_name=自動車重量税法, law_id=346AC0000000089, article=第二条, enforcement_version=2022-04-01, resolution=resolved_by_name, sufficient=true. All statutory terms and dependency fields derived programmatically from the authoritative queue; no hand-typed CJK.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The reference resolves to the pinned law identity: name 自動車重量税法, id 346AC0000000089, article 第二条, enforcement version 2022-04-01. |
| T | `scripts/ci/transcription_audit.py` article-kind check for DisasterTaxReliefArt9VehicleNumberReference.lean. |
| D | PASS — transcription audit 561/561. |
| C | Only the resolved reference identity is modeled. The substantive definition in the external law, the Column#1 term, and legal correctness are out of scope. No external-law Lean constant is imported. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/DisasterTaxReliefArt9VehicleNumberReference.lean` — `CrossLawRef` structure, `definitionReference` with the resolved identity, four field theorems.
- Independent spec: `SpecResolvedRef` Prop conjunction, representationally distinct; `implementation_satisfies_spec` axiom-free (And.intro/rfl).
- Build: full lake build success (1819 jobs); all five unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
External-law substantive definition, Column#1 term, legal correctness — all NOT MODELLED.

## Dependencies (resolved beyond 15-digit id — objective §1.6)
The queue dependency is fully resolved: `law_name=自動車重量税法`, `law_id=346AC0000000089`, `article=第二条`, `enforcement_version=2022-04-01`, `resolution=resolved_by_name`, `sufficient=true`. This is recorded honestly in the kernel model as a String-field identity — no external-law constant is introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_DISASTER_TAX_RELIEF_ART9_VEHICLE_NUMBER_REFERENCE.md`.
