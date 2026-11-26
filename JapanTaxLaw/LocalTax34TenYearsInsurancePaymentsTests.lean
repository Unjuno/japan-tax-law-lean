import JapanTaxLaw.LocalTax34TenYearsInsurancePaymentsSpec

/- Kernel-decided boundary checks for 「当該契約に基づく保険料又は掛金の払込みは、年金支払開始日前十年以上の期間にわたつて定期に行うものであること。」. -/
namespace JapanTaxLaw.LocalTax34TenYearsInsurancePayments

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 9 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 10 := by unfold inScope threshold; decide  -- threshold_at
example : inScope 11 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 9 = false := by decide  -- threshold_below
example : inScopeBool 10 = true := by decide  -- threshold_at
example : inScopeBool 11 = true := by decide  -- threshold_above
example : inScope 10 ↔ specInScope 10 := agree_scope 10
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax34TenYearsInsurancePayments
