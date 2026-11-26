import JapanTaxLaw.LocalTax34TenYearsInsurancePayments

/- Independent spec for 「当該契約に基づく保険料又は掛金の払込みは、年金支払開始日前十年以上の期間にわたつて定期に行うものであること。」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax34TenYearsInsurancePayments

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≥ 10

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax34TenYearsInsurancePayments
