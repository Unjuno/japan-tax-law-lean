import JapanTaxLaw.LocalFloorArea50_240

/-! Independent spec for LocalFloorArea50_240: `¬ x < 50 ∧ ¬ 240 < x`. -/

namespace JapanTaxLaw.LocalFloorArea50_240Spec

def specInBand (x : Nat) : Bool :=
  decide (¬ x < 50 ∧ ¬ 240 < x)

def agree (x : Nat) : Prop :=
  specInBand x = JapanTaxLaw.LocalFloorArea50_240.inBand x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specInBand JapanTaxLaw.LocalFloorArea50_240.inBand
  unfold JapanTaxLaw.LocalFloorArea50_240.lowerBound JapanTaxLaw.LocalFloorArea50_240.upperBound
  simp

end JapanTaxLaw.LocalFloorArea50_240Spec
