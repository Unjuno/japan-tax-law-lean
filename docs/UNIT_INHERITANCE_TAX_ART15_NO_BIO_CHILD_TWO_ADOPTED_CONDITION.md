# Unit review — 相続税法 第十五条(2) 第二号 CONDITION

Normative unit id: `NORM|e3c065dafc60128427f7b5f314a6f77fe6ec9f329edbf9694aacdf3c47af393b`

Law: 325AC0000000073 (相続税法), Act. SHA-256 c01bb9be…5043a7.

Verbatim source text (injected from the queue, not hand-typed): 「当該被相続人に実子がなく、養子の数が二人以上である場合」

Exact source position: `LawBody[3]/MainProvision/MainProvision[1]/Article:15/Article#15/Paragraph#2/Item#2/ItemSentence/Column#1/Sentence#1` — a table-column condition in Article 15(2). Full Article 15 length 693 chars.

Norm kind: **CONDITION** — item 2: when the decedent has no 実子 (actual child) and the number of 養子 (adopted children) is 二人以上 (two or more). The adjacent column states the resulting adopted-child count (the legal effect), which is a separate norm outside this needle and is NOT MODELLED here. All statutory terms derived programmatically from the needle; no hand-typed CJK.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The condition holds only when there is no actual child and adopted children number two or more (inclusive threshold). |
| T | `scripts/ci/transcription_audit.py` article-kind check for InheritanceTaxArt15NoBioChildTwoAdoptedCondition.lean. |
| D | PASS — transcription audit 539/539. |
| C | Only the condition predicate (Bool + Nat inequality) is modeled. The adjacent column's adopted-child count (legal effect), the rest of Article 15, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/InheritanceTaxArt15NoBioChildTwoAdoptedCondition.lean` — `qualifies` (!hasBioChild && adoptedCount>=2) with four boundary theorems.
- Independent spec: `SpecQualifies` Prop conjunction with Nat inequality, representationally distinct; agreement and universal implication theorems axiom-free (rfl/cases/decide/of_decide_eq_true, no simp).
- Build: full lake build success (1786 jobs); all eight unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Adjacent column's adopted-child count (legal effect), rest of Article 15, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced. The Civil Code references in the enclosing paragraph are outside this needle and are NOT MODELLED here.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_TAX_ART15_NO_BIO_CHILD_TWO_ADOPTED_CONDITION.md`.
