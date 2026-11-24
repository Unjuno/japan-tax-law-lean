import JapanTaxLaw.LiquorMix26Deg

/-! Independent spec for LiquorMix26Deg: strict `¬ x < 26` form. -/

namespace JapanTaxLaw.LiquorMix26DegSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 26)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.LiquorMix26Deg.hasMix26Deg x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.LiquorMix26Deg.hasMix26Deg
  unfold JapanTaxLaw.LiquorMix26Deg.mixFloor26
  simp

end JapanTaxLaw.LiquorMix26DegSpec
