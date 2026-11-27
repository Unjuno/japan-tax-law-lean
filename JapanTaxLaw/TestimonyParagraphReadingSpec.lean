import JapanTaxLaw.TestimonyParagraphReading

/-
# TestimonyParagraphReadingSpec — independent spec for 緊急関税等政令 第四条

Declared statutory scope:
  Law id: 406CO0000000417, revision 406CO0000000417_20090401_421CO0000000110
  Article: 第四条 第九項 — only the selection 「第一項前段又は第二項前段」.

The implementation uses a structural match on Nat constructors.
This spec transcribes the same selection independently with a propositional
equality disjunction (`decide (p = 1 ∨ p = 2)`): a different operator, with no
implementation definition reused in any `spec*` def. The universal agreement
theorem is proved by nested `cases` + kernel computation (`decide`/`rfl`), so
no axiom is introduced.

Not modelled: the content of the applied provisions, the testimony, other
articles, and human legal determination.
-/

namespace JapanTaxLaw.TestimonyParagraphReading

/-- Independent formulation: exactly the two cited paragraph labels are selected. -/
def specAppliesToTestimony (p : Nat) : Bool :=
  decide (p = 1 ∨ p = 2)

/-- Universal, axiom-free kernel correspondence for every paragraph label. -/
theorem agree_applies_to_testimony (p : Nat) :
    appliesToTestimony p = specAppliesToTestimony p := by
  unfold appliesToTestimony specAppliesToTestimony
  cases p with
  | zero => decide
  | succ p =>
    cases p with
    | zero => decide
    | succ p =>
      cases p with
      | zero => decide
      | succ _ => rfl

end JapanTaxLaw.TestimonyParagraphReading
