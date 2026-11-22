import JapanTaxLaw.TaxAccountantFine300k

/-! Independent spec for TaxAccountantFine300k: strict `¬ 300000 < x` form. -/

namespace JapanTaxLaw.TaxAccountantFine300kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 300000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.TaxAccountantFine300k.withinFine300k x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.TaxAccountantFine300k.withinFine300k
  unfold JapanTaxLaw.TaxAccountantFine300k.fineCap300k
  simp

end JapanTaxLaw.TaxAccountantFine300kSpec
