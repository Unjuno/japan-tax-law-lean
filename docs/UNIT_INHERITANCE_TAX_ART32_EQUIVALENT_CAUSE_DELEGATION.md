# Unit review — 相続税法 第32条(1) 第6号 DELEGATION

Normative unit id: `NORM|82d24538082c811fd40812c245cec18adcb9be279741d0f8070dbf6c3497523b`

Law: 325AC0000000073 (相続税法), Act. SHA-256 c01bb9be…043a7.

Verbatim source text (injected from the queue, not hand-typed): 「前各号に規定する事由に準ずるものとして政令で定める事由が生じたこと。」

Exact source position: `LawBody[3]/MainProvision/MainProvision[3]/Article:32/Article#32/Paragraph#1/Item#6/ItemSentence/Sentence#1`.

Norm kind: **DELEGATION** — a cause prescribed by cabinet order as analogous to the listed causes triggers the item. Computable slice: the cause-occurrence/designation conjunction. CJK is byte-verbatim from the pinned source (old spelling 準ずる preserved); English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The item applies only when the cause occurred and cabinet order designates it as analogous. |
| T | `scripts/ci/transcription_audit.py` whole-law check for InheritanceTaxArt32EquivalentCauseDelegation.lean. |
| D | PASS — transcription audit 829/829. |
| C | Only the two-gate conjunction is modeled. Cabinet-order content, preceding items' content, legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/InheritanceTaxArt32EquivalentCauseDelegation.lean` — `inScope` Bool conjunction, three boundary theorems.
- Independent spec: `SpecInScope` Prop conjunction of two equalities, representationally distinct; all four theorems axiom-free.
- Build: full lake build success (2788 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Cabinet-order content, preceding items' content, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_TAX_ART32_EQUIVALENT_CAUSE_DELEGATION.md`.
