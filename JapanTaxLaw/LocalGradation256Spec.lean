import JapanTaxLaw.LocalGradation256

/-! Independent spec for LocalGradation256: strict `¬ x < 256` form. -/

namespace JapanTaxLaw.LocalGradation256Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 256)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.LocalGradation256.hasGradation256 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.LocalGradation256.hasGradation256
  unfold JapanTaxLaw.LocalGradation256.gradationFloor256
  simp

end JapanTaxLaw.LocalGradation256Spec
