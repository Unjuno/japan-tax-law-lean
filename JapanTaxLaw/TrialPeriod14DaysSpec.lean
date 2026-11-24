import JapanTaxLaw.TrialPeriod14Days

/-! Independent spec for TrialPeriod14Days: strict `¬ x <= 14` form. -/

namespace JapanTaxLaw.TrialPeriod14DaysSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 14)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.TrialPeriod14Days.exceedsTrial14 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.TrialPeriod14Days.exceedsTrial14
  unfold JapanTaxLaw.TrialPeriod14Days.trialLimit14
  simp

end JapanTaxLaw.TrialPeriod14DaysSpec
