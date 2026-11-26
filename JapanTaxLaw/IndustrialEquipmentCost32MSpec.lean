import JapanTaxLaw.IndustrialEquipmentCost32M

/-! Independent spec for IndustrialEquipmentCost32M: `¬ x <= 32000000`. -/

namespace JapanTaxLaw.IndustrialEquipmentCost32MSpec

def specTriggered (x : Nat) : Bool := decide (¬ x <= 32000000)
def agree (x : Nat) : Prop := specTriggered x = JapanTaxLaw.IndustrialEquipmentCost32M.triggered x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specTriggered JapanTaxLaw.IndustrialEquipmentCost32M.triggered JapanTaxLaw.IndustrialEquipmentCost32M.limit
  simp

end JapanTaxLaw.IndustrialEquipmentCost32MSpec
