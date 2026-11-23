import JapanTaxLaw.BasicDeductionIncome23M50

/-! Independent spec for BasicDeductionIncome23M50: strict `¬ 23500000 < x` form. -/

namespace JapanTaxLaw.BasicDeductionIncome23M50Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ 23500000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.BasicDeductionIncome23M50.withinIncome23M50 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.BasicDeductionIncome23M50.withinIncome23M50
  unfold JapanTaxLaw.BasicDeductionIncome23M50.incomeCap23M50
  simp

end JapanTaxLaw.BasicDeductionIncome23M50Spec
