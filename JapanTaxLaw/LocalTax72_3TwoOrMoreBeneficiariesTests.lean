import JapanTaxLaw.LocalTax72_3TwoOrMoreBeneficiariesSpec

/- Kernel-decided boundary checks for 「受益者が二以上ある場合における第一項の規定の適用、第二項に規定する信託財産の給付を受けることとされている者に該当するかどうかの判定その他前三項の規定の適用に関し必要な事項は、政令で定める。」. -/
namespace JapanTaxLaw.LocalTax72_3TwoOrMoreBeneficiaries

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

end JapanTaxLaw.LocalTax72_3TwoOrMoreBeneficiaries
