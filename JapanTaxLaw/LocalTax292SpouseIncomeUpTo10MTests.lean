import JapanTaxLaw.LocalTax292SpouseIncomeUpTo10MSpec

/- Kernel-decided boundary checks for 「同一生計配偶者のうち、前年の合計所得金額が千万円以下である市町村民税の納税義務者の配偶者をいう。」. -/
namespace JapanTaxLaw.LocalTax292SpouseIncomeUpTo10M

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 9999999 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 10000000 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 10000001 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 9999999 = true := by decide  -- bool
example : inScopeBool 10000000 = true := by decide  -- bool
example : inScopeBool 10000001 = false := by decide  -- bool
example : inScope 10000000 ↔ specInScope 10000000 := agree_scope 10000000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax292SpouseIncomeUpTo10M
