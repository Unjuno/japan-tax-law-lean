import JapanTaxLaw.LocalTax34OldLifeInsurancePremiumUpTo15KSpec

/- Kernel-decided boundary checks for 「前年中に支払つた旧生命保険料の金額の合計額（前年中において旧生命保険契約等に基づく剰余金の分配若しくは割戻金の割戻しを受け、又は旧生命保険契約等に基づき分配を受ける剰余金若しくは割戻しを受ける割戻金をもつて旧生命保険料の払込みに充てた場合には、当該剰余金又は割戻金の額（旧生命保険料に係る部分の金額に限る。）を控除した残額。以下（２）及び（３）（ｉｉ）において同じ。）が一万五千円以下である場合」. -/
namespace JapanTaxLaw.LocalTax34OldLifeInsurancePremiumUpTo15K

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 14_999 = true := by decide  -- threshold_below
example : inScopeBool 15_000 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 15_001 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope threshold; decide  -- zero (Prop)
example : inScope 15_000 := by unfold inScope threshold; decide  -- threshold_at (inclusive, Prop)
example : inScope 15_000 ↔ specInScope 15_000 := agree_scope 15_000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax34OldLifeInsurancePremiumUpTo15K
