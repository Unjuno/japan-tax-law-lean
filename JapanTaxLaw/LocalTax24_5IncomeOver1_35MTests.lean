import JapanTaxLaw.LocalTax24_5IncomeOver1_35MSpec

/- Kernel-decided boundary checks for 「障害者、未成年者、寡婦又はひとり親（これらの者の前年の合計所得金額が百三十五万円を超える場合を除く。）」. -/
namespace JapanTaxLaw.LocalTax24_5IncomeOver1_35M

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope lower threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope lower threshold; decide  -- small_input
example : ¬ inScope 1_349_999 := by unfold inScope lower threshold; decide  -- threshold_below
example : ¬ inScope 1_350_000 := by unfold inScope lower threshold; decide  -- threshold_at
example : inScope 1_350_001 := by unfold inScope lower threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 1_349_999 = false := by decide  -- threshold_below
example : inScopeBool 1_350_000 = false := by decide  -- threshold_at
example : inScopeBool 1_350_001 = true := by decide  -- threshold_above
example : inScope 1_350_001 ↔ specInScope 1_350_001 := agree_scope 1_350_001
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax24_5IncomeOver1_35M
