import JapanTaxLaw.Gradation256

/-! Independent spec for Gradation256: strict `¬ x < 256` form. -/

namespace JapanTaxLaw.Gradation256Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 256)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.Gradation256.hasGradation256 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.Gradation256.hasGradation256
  unfold JapanTaxLaw.Gradation256.gradationFloor
  simp

end JapanTaxLaw.Gradation256Spec
