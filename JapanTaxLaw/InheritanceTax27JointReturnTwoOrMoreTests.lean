import JapanTaxLaw.InheritanceTax27JointReturnTwoOrMoreSpec

/- Kernel-decided boundary checks for 「同一の被相続人から相続又は遺贈により財産を取得した者又はその者の相続人で第一項、第二項（次条第二項において準用する場合を含む。）又は第三項の規定により申告書を提出すべきもの又は提出することができるものが二人以上ある場合において、当該申告書の提出先の税務署長が同一であるときは、これらの者は、政令で定めるところにより、当該申告書を共同して提出することができる。」. -/
namespace JapanTaxLaw.InheritanceTax27JointReturnTwoOrMore

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_at
example : inScope 3 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = true := by decide  -- bool
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.InheritanceTax27JointReturnTwoOrMore
