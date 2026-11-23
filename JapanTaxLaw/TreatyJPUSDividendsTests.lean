import JapanTaxLaw.TreatyJPUSDividends
import JapanTaxLaw.TreatyJPUSDividendsSpec

/-!
# TreatyJPUSDividendsTests — 第十条（配当）
-/
namespace JapanTaxLaw.TreatyJPUSDividendsTests
open JapanTaxLaw.TreatyJPUSDividends

theorem cap_spec (p : Nat) : dividendRateCap p = JapanTaxLaw.TreatyJPUSDividendsSpec.dividendRateCapSpec p := by rfl
theorem within_spec (r c : Nat) : withinCap r c = JapanTaxLaw.TreatyJPUSDividendsSpec.withinCapSpec r c := by
  unfold withinCap JapanTaxLaw.TreatyJPUSDividendsSpec.withinCapSpec
  by_cases h : r <= c <;> simp [h]
theorem exempt_spec (p : Nat) (pf : Bool) : exemptInSource p pf = JapanTaxLaw.TreatyJPUSDividendsSpec.exemptInSourceSpec p pf := by rfl
theorem applies_spec (r : Bool) : appliesRateRules r = JapanTaxLaw.TreatyJPUSDividendsSpec.appliesRateRulesSpec r := by rfl
example : dividendRateCap 10 = 5 := cap_five_at_10pct
example (p : Nat) (h : 10 <= p) : dividendRateCap p = 5 := cap_five_above_10pct p h
example (p : Nat) (h : p < 10) : dividendRateCap p = 10 := cap_ten_below_10pct p h
example : withinCap 5 5 = true := five_within_cap
example : withinCap 10 5 = false := ten_exceeds_five
example : exemptInSource 50 false = true := exempt_at_50pct
example : exemptInSource 0 true = true := exempt_pension
example : exemptInSource 49 false = false := not_exempt_below_50
example : appliesRateRules true = false := ric_excluded
example : appliesRateRules false = true := non_ric_applies
example : dividendsDeclared = true := dividends_is_declaration

end JapanTaxLaw.TreatyJPUSDividendsTests
