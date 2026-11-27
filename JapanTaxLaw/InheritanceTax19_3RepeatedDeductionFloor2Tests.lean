import JapanTaxLaw.InheritanceTax19_3RepeatedDeductionFloor2Spec

/- Kernel-decided boundary checks for 「第一項の規定に該当する者がその者又はその扶養義務者について既に前二項の規定による控除を受けたことがある者である場合においては、その者又はその扶養義務者がこれらの規定による控除を受けることができる金額は、既に控除を受けた金額の合計額が第一項の規定による控除を受けることができる金額（二回以上これらの規定による控除を受けた場合には、最初に相続又は遺贈により財産を取得した際に同項の規定による控除を受けることができる金額）に満たなかつた場合におけるその満たなかつた部分の金額の範囲内に限」. -/
namespace JapanTaxLaw.InheritanceTax19_3RepeatedDeductionFloor2

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

end JapanTaxLaw.InheritanceTax19_3RepeatedDeductionFloor2
