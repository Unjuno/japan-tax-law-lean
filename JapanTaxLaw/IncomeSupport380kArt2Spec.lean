import JapanTaxLaw.IncomeSupport380kArt2

/-! Independent spec for IncomeSupport380kArt2: strict `¬ x < 380000` form. -/

namespace JapanTaxLaw.IncomeSupport380kArt2Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 380000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.IncomeSupport380kArt2.hasSupport380k x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.IncomeSupport380kArt2.hasSupport380k
  unfold JapanTaxLaw.IncomeSupport380kArt2.supportFloor380k
  simp

end JapanTaxLaw.IncomeSupport380kArt2Spec
