import JapanTaxLaw.InheritanceTax19_3RepeatedDeductionFloor2

/-
# InheritanceTax19_3RepeatedDeductionFloor2Spec — independent spec for 相続税法 Num 19_3/3

Needle 「第一項の規定に該当する者がその者又はその扶養義務者について既に前二項の規定による控除を受けたことがある者である場合においては、その者又はその扶養義務者がこれらの規定による控除を受けることができる金額は、既に控除を受けた金額の合計額が第一項の規定による控除を受けることができる金額（二回以上これらの規定による控除を受けた場合には、最初に相続又は遺贈により財産を取得した際に同項の規定による控除を受けることができる金額）に満たなかつた場合におけるその満たなかつた部分の金額の範囲内に限」.
The implementation uses `threshold ≤ times`; the independent spec states
the statutory INCLUSIVE lower bound as `2 ≤ times`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.InheritanceTax19_3RepeatedDeductionFloor2

open JapanTaxLaw.TaxFinance

def specInScope (times : Nat) : Prop := 2 ≤ times

theorem agree_scope (times : Nat) : inScope times ↔ specInScope times := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.InheritanceTax19_3RepeatedDeductionFloor2
