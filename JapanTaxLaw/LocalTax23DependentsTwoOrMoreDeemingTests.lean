import JapanTaxLaw.LocalTax23DependentsTwoOrMoreDeemingSpec

/- Kernel-decided boundary checks for 「二以上の道府県民税の納税義務者の扶養親族又は特定親族に該当する者がある場合には、その者は、政令で定めるところにより、これらの納税義務者のうちいずれか一の納税義務者の扶養親族又は特定親族にのみ該当するものとみなす。」. -/
namespace JapanTaxLaw.LocalTax23DependentsTwoOrMoreDeeming

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : inScope 3 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = true := by decide  -- bool
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax23DependentsTwoOrMoreDeeming
