import JapanTaxLaw.OkinawaEquip5M

/-! Independent spec for OkinawaEquip5M: strict `¬ x <= 5000000` form. -/

namespace JapanTaxLaw.OkinawaEquip5MSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 5000000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.OkinawaEquip5M.exceedsEquip5M x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.OkinawaEquip5M.exceedsEquip5M
  unfold JapanTaxLaw.OkinawaEquip5M.equipFloor5M
  simp

end JapanTaxLaw.OkinawaEquip5MSpec
