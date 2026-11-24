import JapanTaxLaw.CustomsBoard20

/-! Independent spec for CustomsBoard20: strict `¬ 20 < x` form. -/

namespace JapanTaxLaw.CustomsBoard20Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ 20 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.CustomsBoard20.withinBoard20 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.CustomsBoard20.withinBoard20
  unfold JapanTaxLaw.CustomsBoard20.boardCap20
  simp

end JapanTaxLaw.CustomsBoard20Spec
