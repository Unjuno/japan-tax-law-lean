import JapanTaxLaw.LocalTax314_2PensionOver7ManSpec

/- Kernel-decided boundary checks for 「前年中に支払つた旧個人年金保険料の金額の合計額が七万円を超える場合」. -/
namespace JapanTaxLaw.LocalTax314_2PensionOver7Man

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 6 := by unfold inScope threshold; decide  -- threshold_below
example : ¬ inScope 7 := by unfold inScope threshold; decide  -- threshold_at
example : inScope 8 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 6 = false := by decide  -- threshold_below
example : inScopeBool 7 = false := by decide  -- threshold_at
example : inScopeBool 8 = true := by decide  -- threshold_above
example : inScope 7 ↔ specInScope 7 := agree_scope 7
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax314_2PensionOver7Man
