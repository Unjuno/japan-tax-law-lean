import JapanTaxLaw.LocalTax703_4EighteenPlusInsuredAmount

/-
# LocalTax703_4EighteenPlusInsuredAmountSpec — independent spec for 地方税法 Num 703_4/29/1

Needle 「所得割総額、資産割総額、被保険者均等割総額、十八歳以上被保険者均等割総額及び世帯別平等割総額の合計額」.
The implementation uses `threshold ≤ age`; the independent spec states
the statutory INCLUSIVE lower bound as `18 ≤ age`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.LocalTax703_4EighteenPlusInsuredAmount

open JapanTaxLaw.TaxFinance

def specInScope (age : Nat) : Prop := 18 ≤ age

theorem agree_scope (age : Nat) : inScope age ↔ specInScope age := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax703_4EighteenPlusInsuredAmount
