import JapanTaxLaw.LocalTax314_2NewPersonalAnnuityPremiumUpTo12KSpec

/- Kernel-decided boundary checks for 「前年中に支払つた新個人年金保険料の金額の合計額（前年中において新個人年金保険契約等に基づく剰余金の分配若しくは割戻金の割戻しを受け、又は新個人年金保険契約等に基づき分配を受ける剰余金若しくは割戻しを受ける割戻金をもつて新個人年金保険料の払込みに充てた場合には、当該剰余金又は割戻金の額（新個人年金保険料に係る部分の金額として政令で定めるところにより計算した金額に限る。）を控除した残額。以下（１）及び（３）（ｉ）において同じ。）が一万二千円以下である場合」. -/
namespace JapanTaxLaw.LocalTax314_2NewPersonalAnnuityPremiumUpTo12K

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 11999 = true := by decide  -- threshold_below
example : inScopeBool 12000 = true := by decide  -- threshold_at (INCLUSIVE)
example : inScopeBool 12001 = false := by decide  -- threshold_above
example : inScope 12000 := by unfold inScope; decide  -- threshold_at (Prop, INCLUSIVE)
example : ¬ inScope 12001 := by unfold inScope; decide  -- threshold_above (Prop)
example : inScope 12001 ↔ specInScope 12001 := agree_scope 12001
example (premium : Nat) : inScope premium ↔ specInScope premium := agree_scope premium

end JapanTaxLaw.LocalTax314_2NewPersonalAnnuityPremiumUpTo12K
