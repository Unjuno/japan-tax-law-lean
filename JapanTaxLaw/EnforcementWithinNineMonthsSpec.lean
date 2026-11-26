import JapanTaxLaw.EnforcementWithinNineMonths

/-! Independent spec for EnforcementWithinNineMonths: `¬ 9 < x`. -/

namespace JapanTaxLaw.EnforcementWithinNineMonthsSpec

def specWithin (x : Nat) : Bool := decide (¬ 9 < x)
def agree (x : Nat) : Prop := specWithin x = JapanTaxLaw.EnforcementWithinNineMonths.within x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.EnforcementWithinNineMonths.within JapanTaxLaw.EnforcementWithinNineMonths.limit
  simp

end JapanTaxLaw.EnforcementWithinNineMonthsSpec
