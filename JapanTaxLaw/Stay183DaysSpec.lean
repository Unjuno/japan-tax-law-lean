import JapanTaxLaw.Stay183Days

/-! Independent spec for Stay183Days: strict `¬ 183 < x` form. -/

namespace JapanTaxLaw.Stay183DaysSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 183 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.Stay183Days.withinStay183 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.Stay183Days.withinStay183
  unfold JapanTaxLaw.Stay183Days.stayCap183
  simp

end JapanTaxLaw.Stay183DaysSpec
