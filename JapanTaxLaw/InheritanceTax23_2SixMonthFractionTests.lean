import JapanTaxLaw.InheritanceTax23_2SixMonthFractionSpec

/- Kernel-decided boundary checks for 「当該配偶者居住権の目的となつている建物の耐用年数（所得税法の規定に基づいて定められている耐用年数に準ずるものとして政令で定める年数をいう。ロにおいて同じ。）から建築後の経過年数（六月以上の端数は一年とし、六月に満たない端数は切り捨てる。ロにおいて同じ。）及び当該配偶者居住権の存続年数（当該配偶者居住権が存続する年数として政令で定める年数をいう。次号において同じ。）を控除した年数」. -/
namespace JapanTaxLaw.InheritanceTax23_2SixMonthFraction

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input / threshold_below
example : inScopeBool 5 = false := by decide  -- threshold_below (6 months is INCLUSIVE)
example : inScopeBool 6 = true := by decide  -- threshold_at (INCLUSIVE)
example : inScopeBool 7 = true := by decide  -- threshold_above
example : inScope 6 := by unfold inScope; decide  -- threshold_at (Prop, INCLUSIVE)
example : ¬ inScope 5 := by unfold inScope; decide  -- threshold_below (Prop)
example : inScope 7 ↔ specInScope 7 := agree_scope 7
example (months : Nat) : inScope months ↔ specInScope months := agree_scope months

end JapanTaxLaw.InheritanceTax23_2SixMonthFraction
