import JapanTaxLaw.TreatyJPUSInterest
import JapanTaxLaw.TreatyJPUSInterestSpec

/-!
# TreatyJPUSInterestTests — 第十一条（利子）
-/
namespace JapanTaxLaw.TreatyJPUSInterestTests
open JapanTaxLaw.TreatyJPUSInterest

theorem contingent_cap_spec : contingentInterestCap = JapanTaxLaw.TreatyJPUSInterestSpec.contingentInterestCapSpec := rfl
theorem excess_cap_spec : excessInterestCap = JapanTaxLaw.TreatyJPUSInterestSpec.excessInterestCapSpec := rfl
theorem within_contingent_spec (r : Nat) : withinContingentCap r = JapanTaxLaw.TreatyJPUSInterestSpec.withinContingentCapSpec r := by
  unfold withinContingentCap JapanTaxLaw.TreatyJPUSInterestSpec.withinContingentCapSpec
  by_cases h : r <= 10 <;> simp [h, contingentInterestCap]
theorem within_excess_spec (r : Nat) : withinExcessCap r = JapanTaxLaw.TreatyJPUSInterestSpec.withinExcessCapSpec r := by
  unfold withinExcessCap JapanTaxLaw.TreatyJPUSInterestSpec.withinExcessCapSpec
  by_cases h : r <= 5 <;> simp [h, excessInterestCap]
theorem excess_amount_spec (p n : Nat) : excessAmount p n = JapanTaxLaw.TreatyJPUSInterestSpec.excessAmountSpec p n := rfl
example : sourceTaxOnOrdinaryInterest = false := ordinary_interest_no_source_tax
example : withinContingentCap 10 = true := ten_within_contingent_cap
example : withinContingentCap 15 = false := fifteen_exceeds_contingent_cap
example : withinExcessCap 5 = true := five_within_excess_cap
example : withinExcessCap 10 = false := ten_exceeds_excess_cap
example : excessInterestCap = 5 := excess_cap_five
example (p n : Nat) (h : n < p) : excessAmount p n > 0 := excess_positive p n h
example (n : Nat) : excessAmount n n = 0 := excess_zero_when_equal n
example : interestDeclared = true := interest_is_declaration

end JapanTaxLaw.TreatyJPUSInterestTests
