import JapanTaxLaw.RetirementIncome3M

/-! Independent spec for RetirementIncome3M: strict `¬ 3000000 < x` form. -/

namespace JapanTaxLaw.RetirementIncome3MSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 3000000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.RetirementIncome3M.withinRetirement3M x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.RetirementIncome3M.withinRetirement3M
  unfold JapanTaxLaw.RetirementIncome3M.retirementCap3M
  simp

end JapanTaxLaw.RetirementIncome3MSpec
