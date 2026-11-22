import JapanTaxLaw.TaxService15Years

/-! Independent spec for TaxService15Years: strict `¬ x < 15` form. -/

namespace JapanTaxLaw.TaxService15YearsSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 15)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.TaxService15Years.has15Years x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.TaxService15Years.has15Years
  unfold JapanTaxLaw.TaxService15Years.serviceYears15
  simp

end JapanTaxLaw.TaxService15YearsSpec
