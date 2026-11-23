import JapanTaxLaw.RetirementAggregate3M

/-! Independent spec for RetirementAggregate3M: strict `¬ 3000000 < x` form. -/

namespace JapanTaxLaw.RetirementAggregate3MSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 3000000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.RetirementAggregate3M.withinAggregate3M x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.RetirementAggregate3M.withinAggregate3M
  unfold JapanTaxLaw.RetirementAggregate3M.aggregateCap3M
  simp

end JapanTaxLaw.RetirementAggregate3MSpec
