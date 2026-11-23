import JapanTaxLaw.MiningTaxMonthlyProration
import JapanTaxLaw.MiningTaxMonthlyProrationSpec

/-!
# MiningTaxMonthlyProrationTests — 地方税法 第百八十三条
-/
namespace JapanTaxLaw.MiningTaxMonthlyProrationTests
open JapanTaxLaw.MiningTaxMonthlyProration

theorem start_spec (s : Nat) : monthsFromNextMonth s = JapanTaxLaw.MiningTaxMonthlyProrationSpec.monthsFromNextMonthSpec s := by rfl
theorem end_spec (e : Nat) : monthsUntilExtinction e = JapanTaxLaw.MiningTaxMonthlyProrationSpec.monthsUntilExtinctionSpec e := by rfl
theorem applies_spec (s : Bool) : monthlyApplies s = JapanTaxLaw.MiningTaxMonthlyProrationSpec.monthlyAppliesSpec s := by rfl
example : monthsFromNextMonth 0 = 12 := jan_start_12_months
example : monthsFromNextMonth 11 = 1 := dec_start_1_month
example : monthsUntilExtinction 1 = 1 := jan_end_1_month
example : monthsUntilExtinction 12 = 12 := dec_end_12_months
example : monthlyApplies false = true := no_succession_monthly
example : monthlyApplies true = false := succession_no_monthly
example : miningTaxMonthlyProrationDeclared = true := mining_tax_monthly_proration_is_declaration

end JapanTaxLaw.MiningTaxMonthlyProrationTests
