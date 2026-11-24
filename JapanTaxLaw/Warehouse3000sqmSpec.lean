import JapanTaxLaw.Warehouse3000sqm

/-! Independent spec for Warehouse3000sqm: strict `¬ x < 3000` form. -/

namespace JapanTaxLaw.Warehouse3000sqmSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 3000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.Warehouse3000sqm.hasWarehouse3000 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.Warehouse3000sqm.hasWarehouse3000
  unfold JapanTaxLaw.Warehouse3000sqm.warehouseFloor3000
  simp

end JapanTaxLaw.Warehouse3000sqmSpec
