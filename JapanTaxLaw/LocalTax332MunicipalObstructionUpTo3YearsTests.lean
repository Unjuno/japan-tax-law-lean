import JapanTaxLaw.LocalTax332MunicipalObstructionUpTo3YearsSpec

/- Kernel-decided boundary checks for 「市町村民税の納税者又は特別徴収義務者が滞納処分の執行を免れる目的でその財産を隠蔽し、損壊し、若しくは市町村の不利益に処分し、その財産に係る負担を偽つて増加する行為をし、又はその現状を改変して、その財産の価額を減損し、若しくはその滞納処分に係る滞納処分費を増大させる行為をしたときは、その者は、三年以下の拘禁刑若しくは二百五十万円以下の罰金に処し、又はこれを併科する。」. -/
namespace JapanTaxLaw.LocalTax332MunicipalObstructionUpTo3Years

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 2 = true := by decide  -- threshold_below
example : inScopeBool 3 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 4 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 3 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 4 := by unfold inScope; decide  -- outside (Prop)
example : inScope 3 ↔ specInScope 3 := agree_scope 3
example (years : Nat) : inScope years ↔ specInScope years := agree_scope years

end JapanTaxLaw.LocalTax332MunicipalObstructionUpTo3Years
