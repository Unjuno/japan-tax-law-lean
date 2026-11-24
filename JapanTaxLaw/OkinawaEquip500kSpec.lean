import JapanTaxLaw.OkinawaEquip500k

/-! Independent spec for OkinawaEquip500k: strict `¬ x <= 500000` form. -/

namespace JapanTaxLaw.OkinawaEquip500kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 500000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.OkinawaEquip500k.exceedsEquip500k x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.OkinawaEquip500k.exceedsEquip500k
  unfold JapanTaxLaw.OkinawaEquip500k.equipFloor500k
  simp

end JapanTaxLaw.OkinawaEquip500kSpec
