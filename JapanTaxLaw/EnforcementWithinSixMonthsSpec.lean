import JapanTaxLaw.EnforcementWithinSixMonths

/-! Independent spec for EnforcementWithinSixMonths: `¬ 6 < x`. -/

namespace JapanTaxLaw.EnforcementWithinSixMonthsSpec

def specWithin (x : Nat) : Bool := decide (¬ 6 < x)
def agree (x : Nat) : Prop := specWithin x = JapanTaxLaw.EnforcementWithinSixMonths.within x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.EnforcementWithinSixMonths.within JapanTaxLaw.EnforcementWithinSixMonths.limit
  simp

end JapanTaxLaw.EnforcementWithinSixMonthsSpec
