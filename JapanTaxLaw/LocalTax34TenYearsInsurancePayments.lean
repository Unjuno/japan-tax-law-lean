import JapanTaxLaw.TaxFinance

/-
# LocalTax34TenYearsInsurancePayments — pinned clause 「当該契約に基づく保険料又は掛金の払込みは、年金支払開始日前十年以上の期間にわたつて定期に行うものであること。」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 34.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|6b39d2ffd783c701be469af1874187be43b3dfbf3fc741e88ac530e7cb3e3bb2.
原文逐語: 「当該契約に基づく保険料又は掛金の払込みは、年金支払開始日前十年以上の期間にわたつて定期に行うものであること。」
Scope: ONLY the threshold of this clause. Other amounts, classifications,
procedures and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax34TenYearsInsurancePayments

open JapanTaxLaw.TaxFinance

/-- Statutory threshold — 十年以上 (inclusive floor). -/
def threshold : Nat := 10

/-- 「当該契約に基づく保険料又は掛金の払込みは、年金支払開始日前十年以上の期間にわたつて定期に行うものであること。」. -/
def inScope (amount : Nat) : Prop := amount ≥ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≥ 10)

end JapanTaxLaw.LocalTax34TenYearsInsurancePayments
