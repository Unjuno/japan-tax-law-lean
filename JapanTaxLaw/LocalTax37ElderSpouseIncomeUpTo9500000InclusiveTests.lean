import JapanTaxLaw.LocalTax37ElderSpouseIncomeUpTo9500000InclusiveSpec

/- Kernel-decided boundary checks for 「（ｉｉ）　当該控除対象配偶者が老人控除対象配偶者である場合　十万円（当該納税義務者の前年の合計所得金額が九百万円を超え九百五十万円以下である場合には六万円、当該納税義務者の前年の合計所得金額が九百五十万円を超え千万円以下である場合には三万円）」. -/
namespace JapanTaxLaw.LocalTax37ElderSpouseIncomeUpTo9500000Inclusive

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 9_499_999 = true := by decide  -- threshold_below
example : inScopeBool 9_500_000 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 9_500_001 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 9_500_000 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 9_500_001 := by unfold inScope; decide  -- outside (Prop)
example : inScope 9_500_000 ↔ specInScope 9_500_000 := agree_scope 9_500_000
example (income : Nat) : inScope income ↔ specInScope income := agree_scope income

end JapanTaxLaw.LocalTax37ElderSpouseIncomeUpTo9500000Inclusive
