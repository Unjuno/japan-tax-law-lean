import JapanTaxLaw.ShortMeasure180Days

/-! Independent spec for ShortMeasure180Days: strict `¬ 180 < x` form. -/

namespace JapanTaxLaw.ShortMeasure180DaysSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 180 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.ShortMeasure180Days.withinShortMeasure x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.ShortMeasure180Days.withinShortMeasure
  unfold JapanTaxLaw.ShortMeasure180Days.shortMeasureDays
  simp

end JapanTaxLaw.ShortMeasure180DaysSpec
