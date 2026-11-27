import JapanTaxLaw.LocalTax72_38_2ExtensionWithin3YearsSpec

/- Kernel-decided boundary checks for 「道府県知事は、第一項の規定により徴収を猶予した場合において、その猶予をした期間内にその猶予をした金額を納付することができないやむを得ない理由があると認めるときは、当該法人の申請により、三年以内の期間を限りその期間を延長することができる。」. -/
namespace JapanTaxLaw.LocalTax72_38_2ExtensionWithin3Years

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 3 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 4 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = true := by decide  -- bool
example : inScopeBool 4 = false := by decide  -- bool
example : inScope 3 ↔ specInScope 3 := agree_scope 3
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_38_2ExtensionWithin3Years
