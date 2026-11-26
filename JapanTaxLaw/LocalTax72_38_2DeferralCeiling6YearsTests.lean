import JapanTaxLaw.LocalTax72_38_2DeferralCeiling6YearsSpec

/- Kernel-decided boundary checks for 「ただし、その期間は、既に当該法人につき同項の規定により徴収を猶予した期間と合わせて六年を超えることができない。」. -/
namespace JapanTaxLaw.LocalTax72_38_2DeferralCeiling6Years

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 5 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 6 := by unfold inScope threshold; decide  -- threshold_at
example : ¬ inScope 7 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 5 = true := by decide  -- threshold_below
example : inScopeBool 6 = true := by decide  -- threshold_at
example : inScopeBool 7 = false := by decide  -- threshold_above
example : inScope 6 ↔ specInScope 6 := agree_scope 6
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_38_2DeferralCeiling6Years
