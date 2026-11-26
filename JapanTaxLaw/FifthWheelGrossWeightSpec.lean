import JapanTaxLaw.FifthWheelGrossWeight

/-! Independent spec: explicit case split on whether the fifth-wheel load is
deductible, written before the towing weight is added. The only bridge is the
universal kernel-checked omega theorem `agreeGrossWeight`. -/
namespace JapanTaxLaw.FifthWheelGrossWeight

@[reducible] def specGrossWeight (recorded fifthWheel towing : Nat) : Nat :=
  if fifthWheel <= recorded then (recorded - fifthWheel) + towing else towing

theorem agreeGrossWeight (recorded fifthWheel towing : Nat) :
    specGrossWeight recorded fifthWheel towing = grossWeight recorded fifthWheel towing := by
  unfold specGrossWeight grossWeight
  by_cases h : fifthWheel <= recorded
  · simp [h]
  · have hgt : recorded < fifthWheel := Nat.lt_of_not_ge h
    simp [h]
    omega

end JapanTaxLaw.FifthWheelGrossWeight
