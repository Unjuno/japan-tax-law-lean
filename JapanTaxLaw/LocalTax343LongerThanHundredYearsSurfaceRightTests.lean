import JapanTaxLaw.LocalTax343LongerThanHundredYearsSurfaceRightSpec

/- Kernel-decided boundary checks for 「固定資産税は、固定資産の所有者（質権又は百年より永い存続期間の定めのある地上権の目的である土地については、その質権者又は地上権者とする。以下固定資産税について同様とする。）に課する。」. -/
namespace JapanTaxLaw.LocalTax343LongerThanHundredYearsSurfaceRight

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input / threshold_below
example : inScopeBool 99 = false := by decide  -- threshold_below
example : inScopeBool 100 = false := by decide  -- threshold_at (STRICT: equality excluded)
example : inScopeBool 101 = true := by decide  -- threshold_above
example : inScope 101 := by unfold inScope; decide  -- threshold_above (Prop)
example : ¬ inScope 100 := by unfold inScope; decide  -- threshold_at (STRICT, Prop)
example : inScope 101 ↔ specInScope 101 := agree_scope 101
example (years : Nat) : inScope years ↔ specInScope years := agree_scope years

end JapanTaxLaw.LocalTax343LongerThanHundredYearsSurfaceRight
