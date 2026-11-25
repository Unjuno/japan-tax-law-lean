import JapanTaxLaw.CommonLandAreaTenTimes

/-! Independent spec for CommonLandAreaTenTimes: `¬ 10 * x <= 0` (no division). -/

namespace JapanTaxLaw.CommonLandAreaTenTimesSpec

def specTriggered (x : Nat) : Bool := decide (¬ 10 * x <= 0)
def agree (x : Nat) : Prop := specTriggered x = JapanTaxLaw.CommonLandAreaTenTimes.triggered x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specTriggered JapanTaxLaw.CommonLandAreaTenTimes.triggered
  unfold JapanTaxLaw.CommonLandAreaTenTimes.multiplier JapanTaxLaw.CommonLandAreaTenTimes.threshold
  by_cases h : x = 0
  · subst x
    decide
  · have hpos : 0 < 10 * x := by omega
    have hnot : ¬ 10 * x <= 0 := by omega
    simp [hpos, hnot]

end JapanTaxLaw.CommonLandAreaTenTimesSpec
