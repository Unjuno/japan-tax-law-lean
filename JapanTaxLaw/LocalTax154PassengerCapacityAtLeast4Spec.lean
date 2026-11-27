import JapanTaxLaw.LocalTax154PassengerCapacityAtLeast4

/-
# LocalTax154PassengerCapacityAtLeast4Spec — independent spec for 地方税法 Num 154/2

Needle 「前項第二号に掲げる自動車のうち最大乗車定員が四人以上であるものに対して課する自動車税の標準税率は、同項（同号に係る部分に限る。）の規定にかかわらず、同号に定める額に、次の各号の区分に応じ当該各号に定める額を、それぞれ加算した額とする。」.
The implementation uses `threshold ≤ passengers`; the independent spec states
the statutory INCLUSIVE lower bound as `4 ≤ passengers`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.LocalTax154PassengerCapacityAtLeast4

open JapanTaxLaw.TaxFinance

def specInScope (passengers : Nat) : Prop := 4 ≤ passengers

theorem agree_scope (passengers : Nat) : inScope passengers ↔ specInScope passengers := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax154PassengerCapacityAtLeast4
