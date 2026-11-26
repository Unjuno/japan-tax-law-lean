import JapanTaxLaw.LocalTax314_2NewAnnuityOver56kSpec

/- Kernel-decided boundary checks for 「前年中に支払つた新個人年金保険料の金額の合計額が五万六千円を超える場合」. -/
namespace JapanTaxLaw.LocalTax314_2NewAnnuityOver56k

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope lower threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope lower threshold; decide  -- small_input
example : ¬ inScope 55_999 := by unfold inScope lower threshold; decide  -- threshold_below
example : ¬ inScope 56_000 := by unfold inScope lower threshold; decide  -- threshold_at
example : inScope 56_001 := by unfold inScope lower threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 55_999 = false := by decide  -- threshold_below
example : inScopeBool 56_000 = false := by decide  -- threshold_at
example : inScopeBool 56_001 = true := by decide  -- threshold_above
example : inScope 56_001 ↔ specInScope 56_001 := agree_scope 56_001
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax314_2NewAnnuityOver56k
