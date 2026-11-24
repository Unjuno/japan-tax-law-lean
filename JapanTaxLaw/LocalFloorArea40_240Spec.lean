import JapanTaxLaw.LocalFloorArea40_240

/-! Independent spec for LocalFloorArea40_240: `¬ x < 40 ∧ ¬ 240 < x`. -/

namespace JapanTaxLaw.LocalFloorArea40_240Spec

def specInBand (x : Nat) : Bool :=
  decide (¬ x < 40 ∧ ¬ 240 < x)

def agree (x : Nat) : Prop :=
  specInBand x = JapanTaxLaw.LocalFloorArea40_240.inBand x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specInBand JapanTaxLaw.LocalFloorArea40_240.inBand
  unfold JapanTaxLaw.LocalFloorArea40_240.lowerBound JapanTaxLaw.LocalFloorArea40_240.upperBound
  simp

end JapanTaxLaw.LocalFloorArea40_240Spec
