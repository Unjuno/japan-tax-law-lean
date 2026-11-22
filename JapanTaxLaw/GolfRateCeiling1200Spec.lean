import JapanTaxLaw.GolfRateCeiling1200

/-! Independent spec for GolfRateCeiling1200: strict `¬ 1200 < x` form. -/

namespace JapanTaxLaw.GolfRateCeiling1200Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ 1200 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.GolfRateCeiling1200.withinGolfRate x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.GolfRateCeiling1200.withinGolfRate
  unfold JapanTaxLaw.GolfRateCeiling1200.golfRateCapYen
  simp

end JapanTaxLaw.GolfRateCeiling1200Spec
