import JapanTaxLaw.DeceasedUnder70

/-! Independent spec for DeceasedUnder70: strict `¬ 70 <= x` form. -/

namespace JapanTaxLaw.DeceasedUnder70Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ 70 <= x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.DeceasedUnder70.isDeceasedUnder70 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.DeceasedUnder70.isDeceasedUnder70
  unfold JapanTaxLaw.DeceasedUnder70.ageLimit70
  simp

end JapanTaxLaw.DeceasedUnder70Spec
