# Unit review — 災害被害者租税減免法 第八条(2) DELEGATION

Normative unit id: `NORM|d351e6ace9606ec2a4061c0a13824f8b21e9bbee9be7c1457e7d7cafbf136433`

Law: 322AC0000000175 (災害被害者に対する租税の減免、徴収猶予等に関する法律), Act.
SHA-256 c3bb5b0b…f5f4e7ef.

Verbatim source text (injected from the queue, not hand-typed): 「前項に定めるもののほか、同項の規定の適用に関し必要な事項は、政令で定める。」

Exact source position: `LawBody[1]/MainProvision/MainProvision[7]/Article:8/Article#8/Paragraph#2/ParagraphSentence/Sentence#1` — the whole Paragraph 2 is this sentence.

Norm kind: **DELEGATION** — Article 8(2) delegates to Cabinet Order (政令) the residual matters necessary for applying the preceding paragraph's provisions, other than those already prescribed there. All statutory facts derived from the needle; no hand-typed CJK.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The delegation target is Cabinet Order, not statute. A matter is delegated iff it is necessary for application AND not already prescribed in the preceding paragraph. |
| T | `scripts/ci/transcription_audit.py` article-kind check for DisasterTaxReliefArt8Delegation.lean. |
| D | PASS — transcription audit 473/473. |
| C | Only the delegation target and residual-scope predicate are modeled. The content of the delegated Cabinet Order, the preceding paragraph's substance, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/DisasterTaxReliefArt8Delegation.lean` — `DelegationTarget` (cabinetOrder/statute), `delegatedTarget=cabinetOrder`, `isDelegatedMatter` Bool residual predicate, four boundary theorems.
- Independent spec: `SpecDelegatedMatter` Prop conjunction, representationally distinct; `spec_residual`, `agree_residual`, `spec_target` axiom-free (rfl/And.intro).
- Build: full lake build success (1555 jobs); all seven unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Delegated Cabinet Order content, preceding paragraph substance, legal correctness.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced. The 政令 delegation is recorded as a structural fact only — the delegated instrument's content is NOT MODELLED.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_DISASTER_TAX_RELIEF_ART8_DELEGATION.md`.
