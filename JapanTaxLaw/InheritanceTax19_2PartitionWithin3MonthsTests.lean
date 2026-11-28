import JapanTaxLaw.InheritanceTax19_2PartitionWithin3MonthsSpec

/- Kernel-decided boundary checks for 「ただし、その分割されていない財産が申告期限から三年以内（当該期間が経過するまでの間に当該財産が分割されなかつたことにつき、当該相続又は遺贈に関し訴えの提起がされたことその他の政令で定めるやむを得ない事情がある場合において、政令で定めるところにより納税地の所轄税務署長の承認を受けたときは、当該財産の分割ができることとなつた日として政令で定める日の翌日から四月以内）に分割された場合には、その分割された財産については、この限りでない。」. -/
namespace JapanTaxLaw.InheritanceTax19_2PartitionWithin3Months

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 2 = true := by decide  -- threshold_below
example : inScopeBool 3 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 4 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 3 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 4 := by unfold inScope; decide  -- outside (Prop)
example : inScope 3 ↔ specInScope 3 := agree_scope 3
example (months : Nat) : inScope months ↔ specInScope months := agree_scope months

end JapanTaxLaw.InheritanceTax19_2PartitionWithin3Months
