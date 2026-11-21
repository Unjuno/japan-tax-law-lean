import JapanTaxLaw.CourseHoursThreshold

/-!
# CourseHoursThresholdSpec — independent spec for 法人税法施行規則 art. 7

Scoped claim: independently transcribed 六十時間 (60) with a strict
`59 < hours` formulation, rather than the implementation's `60 <= hours`.
Agreement is checked in the Lean kernel.
-/

namespace JapanTaxLaw.CourseHoursThresholdSpec

def specMeets (hours : Nat) : Bool :=
  decide (¬ hours < 60)

def agreeMeets (h : Nat) : Prop :=
  specMeets h = JapanTaxLaw.CourseHoursThreshold.meetsAnnualHours h

theorem agree_meets (h : Nat) : agreeMeets h := by
  unfold agreeMeets specMeets JapanTaxLaw.CourseHoursThreshold.meetsAnnualHours
  unfold JapanTaxLaw.CourseHoursThreshold.annualHoursThreshold
  simp

end JapanTaxLaw.CourseHoursThresholdSpec
