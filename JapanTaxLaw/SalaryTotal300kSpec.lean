import JapanTaxLaw.SalaryTotal300k

/-! Independent spec for SalaryTotal300k: strict `¬ 300000 < x` form. -/

namespace JapanTaxLaw.SalaryTotal300kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 300000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.SalaryTotal300k.withinSalaryTotal x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.SalaryTotal300k.withinSalaryTotal
  unfold JapanTaxLaw.SalaryTotal300k.salaryTotalCapYen
  simp

end JapanTaxLaw.SalaryTotal300kSpec
