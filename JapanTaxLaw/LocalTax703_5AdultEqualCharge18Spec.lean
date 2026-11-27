import JapanTaxLaw.LocalTax703_5AdultEqualCharge18

/-
# LocalTax703_5AdultEqualCharge18Spec — independent spec for 地方税法 Num 703_5/3

Needle 「市町村は、国民健康保険税の納税義務者又はその世帯に属する被保険者が出産する予定の場合又は出産した場合には、政令で定める基準に従い当該市町村の条例で定めるところにより、当該納税義務者に対して課する所得割額、被保険者均等割額及び十八歳以上被保険者均等割額を減額するものとする。」.
The implementation uses `threshold ≤ age`; the independent spec states
the statutory INCLUSIVE lower bound as `18 ≤ age`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.LocalTax703_5AdultEqualCharge18

open JapanTaxLaw.TaxFinance

def specInScope (age : Nat) : Prop := 18 ≤ age

theorem agree_scope (age : Nat) : inScope age ↔ specInScope age := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax703_5AdultEqualCharge18
