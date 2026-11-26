import JapanTaxLaw.FifthWheelGrossWeight

/-! Independent spec: explicit case split on whether the fifth-wheel load is
deductible, written before the towing weight is added. The bridge is a
constructive case analysis on `fifthWheel <= recorded`. -/
namespace JapanTaxLaw.FifthWheelGrossWeight

@[reducible] def specGrossWeight (recorded fifthWheel towing : Nat) : Nat :=
  if fifthWheel <= recorded then (recorded - fifthWheel) + towing else towing

theorem agreeGrossWeight (recorded fifthWheel towing : Nat) :
    specGrossWeight recorded fifthWheel towing = grossWeight recorded fifthWheel towing := by
  unfold specGrossWeight grossWeight
  by_cases h : fifthWheel <= recorded
  · simp [h]
  · have hle : recorded <= fifthWheel := Nat.le_of_lt (Nat.lt_of_not_ge h)
    have hz : recorded - fifthWheel = 0 := Nat.sub_eq_zero_of_le hle
    simp [h, hz]

end JapanTaxLaw.FifthWheelGrossWeight
