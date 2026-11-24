import JapanTaxLaw.OkinawaShochu1300kL

/-! Independent spec for OkinawaShochu1300kL: strict `¬ x <= 1300` form. -/

namespace JapanTaxLaw.OkinawaShochu1300kLSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 1300)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.OkinawaShochu1300kL.exceedsShochu1300 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.OkinawaShochu1300kL.exceedsShochu1300
  unfold JapanTaxLaw.OkinawaShochu1300kL.shochuFloor1300
  simp

end JapanTaxLaw.OkinawaShochu1300kLSpec
