import JapanTaxLaw.LocalTax34QuakePremiumCapOver25000StrictSpec

/- Kernel-decided boundary checks for 「前年中に支払つた地震保険料の金額の合計額（前年中において損害保険契約等に基づく剰余金の分配若しくは割戻金の割戻しを受け、又は損害保険契約等に基づき分配を受ける剰余金若しくは割戻しを受ける割戻金をもつて地震保険料の払込みに充てた場合には、当該剰余金又は割戻金の額（地震保険料に係る部分の金額に限る。）を控除した残額）の二分の一に相当する金額（その金額が二万五千円を超える場合には、二万五千円）」. -/
namespace JapanTaxLaw.LocalTax34QuakePremiumCapOver25000Strict

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 24_999 = false := by decide  -- threshold_below
example : inScopeBool 25_000 = false := by decide  -- threshold_at (exclusive)
example : inScopeBool 25_001 = true := by decide  -- threshold_above
example : ¬ inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : ¬ inScope 25_000 := by unfold inScope; decide  -- threshold_at (exclusive, Prop)
example : inScope 25_001 := by unfold inScope; decide  -- outside (Prop, above)
example : inScope 25_001 ↔ specInScope 25_001 := agree_scope 25_001
example (yen : Nat) : inScope yen ↔ specInScope yen := agree_scope yen

end JapanTaxLaw.LocalTax34QuakePremiumCapOver25000Strict
