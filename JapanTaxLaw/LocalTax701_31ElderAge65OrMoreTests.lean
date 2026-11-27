import JapanTaxLaw.LocalTax701_31ElderAge65OrMoreSpec

/- Kernel-decided boundary checks for 「前項第五号の場合において、障害者、年齢六十五歳以上の者又は雇用改善助成対象者であるかどうかの判定は、その者に対して給与等が支払われる時の現況によるものとする。」. -/
namespace JapanTaxLaw.LocalTax701_31ElderAge65OrMore

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 64 = false := by decide  -- threshold_below
example : inScopeBool 65 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 66 = true := by decide  -- threshold_above
example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero (Prop)
example : inScope 65 := by unfold inScope threshold; decide  -- threshold_at (inclusive, Prop)
example : inScope 65 ↔ specInScope 65 := agree_scope 65
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax701_31ElderAge65OrMore
