import JapanTaxLaw.LocalTax72_3TwoOrMoreBeneficiaries

/-
# LocalTax72_3TwoOrMoreBeneficiariesSpec — independent spec for 地方税法 Num 72_3/4

Needle 「受益者が二以上ある場合における第一項の規定の適用、第二項に規定する信託財産の給付を受けることとされている者に該当するかどうかの判定その他前三項の規定の適用に関し必要な事項は、政令で定める。」.
The implementation uses `threshold ≤ beneficiaries`; the independent spec states
the statutory INCLUSIVE lower bound as `2 ≤ beneficiaries`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.LocalTax72_3TwoOrMoreBeneficiaries

open JapanTaxLaw.TaxFinance

def specInScope (beneficiaries : Nat) : Prop := 2 ≤ beneficiaries

theorem agree_scope (beneficiaries : Nat) : inScope beneficiaries ↔ specInScope beneficiaries := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax72_3TwoOrMoreBeneficiaries
