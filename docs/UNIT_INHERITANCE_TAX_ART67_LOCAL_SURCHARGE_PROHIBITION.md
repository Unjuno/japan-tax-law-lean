# Unit review — 相続税法 第六十七条 EFFECT

Normative unit id: `NORM|0b8a19d9bdded2a705b40e195fe00f80c0287dd8fbb3abfb0f1c51511ecde0ec`

Law: 325AC0000000073 (相続税法), Act. SHA-256 c01bb9be…5043a7.

Verbatim source text (injected from the queue, not hand-typed): 「地方公共団体は、相続税又は贈与税の付加税を課することができない。」

Exact source position: `LawBody[3]/MainProvision/MainProvision[6]/Article:67/Article#67/Paragraph#1/ParagraphSentence/Sentence#1`.

Norm kind: **EFFECT** — a prohibition: 地方公共団体 (local public entities) cannot impose a 付加税 on 相続税 or 贈与税. Computable slice: the prohibition discriminator (local entity surcharge on the two named taxes). All statutory terms derived programmatically from the needle; no hand-typed CJK.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | A local public entity's surcharge on inheritance or gift tax is prohibited; non-local or other-tax cases are not prohibited by this provision. |
| T | `scripts/ci/transcription_audit.py` article-kind check for InheritanceTaxArt67LocalSurchargeProhibition.lean. |
| D | PASS — transcription audit 604/604. |
| C | Only the prohibition discriminator is modeled. Penalties, enforcement, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/InheritanceTaxArt67LocalSurchargeProhibition.lean` — `TaxKind` (inheritance/gift/other), `isProhibited` with four boundary theorems.
- Independent spec: `SpecProhibited` Prop conjunction/disjunction, representationally distinct; theorems axiom-free (rfl/Or.inl/cases).
- Build: full lake build success (1975 jobs); all seven unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Penalties, enforcement, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_TAX_ART67_LOCAL_SURCHARGE_PROHIBITION.md`.
