import JapanTaxLaw.LocalTax7NoticeCountOver5Spec

/- Kernel-decided boundary checks for 「都道府県知事等の数が五を超えたとき」. -/
namespace JapanTaxLaw.LocalTax7NoticeCountOver5

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 4 := by unfold inScope threshold; decide  -- threshold_below
example : ¬ inScope 5 := by unfold inScope threshold; decide  -- threshold_at (を超え strict)
example : inScope 6 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 4 = false := by decide  -- threshold_below
example : inScopeBool 5 = false := by decide  -- threshold_at
example : inScopeBool 6 = true := by decide  -- threshold_above
example : inScope 5 ↔ specInScope 5 := agree_scope 5
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax7NoticeCountOver5
