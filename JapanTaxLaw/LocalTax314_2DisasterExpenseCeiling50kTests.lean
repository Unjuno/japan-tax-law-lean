import JapanTaxLaw.LocalTax314_2DisasterExpenseCeiling50kSpec

/- Kernel-decided boundary checks for 「災害関連支出の金額が五万円以下である場合（金額がない場合を含む）」. -/
namespace JapanTaxLaw.LocalTax314_2DisasterExpenseCeiling50k

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 49999 := by unfold inScope threshold; decide  -- below_ceiling
example : inScope 50000 := by unfold inScope threshold; decide  -- ceiling_at (以下 inclusive)
example : ¬ inScope 50001 := by unfold inScope threshold; decide  -- above_ceiling
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 49999 = true := by decide  -- bool
example : inScopeBool 50000 = true := by decide  -- bool
example : inScopeBool 50001 = false := by decide  -- bool
example : inScope 50000 ↔ specInScope 50000 := agree_scope 50000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax314_2DisasterExpenseCeiling50k
