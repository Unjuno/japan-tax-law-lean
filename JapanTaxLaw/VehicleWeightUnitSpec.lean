import JapanTaxLaw.VehicleWeightUnit

/-!
# VehicleWeightUnitSpec — independent spec for 自動車重量税法 art. 7

The independent definition uses the raw statute literal 五 (0.5 t = 5 tenths)
written directly as `(w + 4) / 5`, while the implementation uses
`(w + 5 - 1) / 5`. Agreement is checked in the Lean kernel.
-/

namespace JapanTaxLaw.VehicleWeightUnitSpec

def specWeightUnits (weightTenths : Nat) : Nat :=
  (weightTenths + 4) / 5

def agreeWeightUnits (w : Nat) : Prop :=
  specWeightUnits w = JapanTaxLaw.VehicleWeightUnit.weightUnits w

theorem agree_weight_units (w : Nat) : agreeWeightUnits w := by
  unfold agreeWeightUnits specWeightUnits JapanTaxLaw.VehicleWeightUnit.weightUnits
  rfl

end JapanTaxLaw.VehicleWeightUnitSpec
