import JapanTaxLaw.TaxErasureTotal60

/-! Independent spec for TaxErasureTotal60: strict `¬ 60 < x` form. -/

namespace JapanTaxLaw.TaxErasureTotal60Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ 60 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.TaxErasureTotal60.withinTotalErasure x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.TaxErasureTotal60.withinTotalErasure
  unfold JapanTaxLaw.TaxErasureTotal60.totalCapDays
  simp

end JapanTaxLaw.TaxErasureTotal60Spec
