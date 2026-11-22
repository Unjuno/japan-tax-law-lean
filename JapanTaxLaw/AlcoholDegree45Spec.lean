import JapanTaxLaw.AlcoholDegree45

/-! Independent spec for AlcoholDegree45: strict `¬ 45 < x` form. -/

namespace JapanTaxLaw.AlcoholDegree45Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ 45 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.AlcoholDegree45.withinAlcohol45 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.AlcoholDegree45.withinAlcohol45
  unfold JapanTaxLaw.AlcoholDegree45.degreeCeiling
  simp

end JapanTaxLaw.AlcoholDegree45Spec
