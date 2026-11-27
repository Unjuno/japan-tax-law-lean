import JapanTaxLaw.LocalTax321_7_4TwoAnnuityPaymentsDelegation

/-
# LocalTax321_7_4TwoAnnuityPaymentsDelegationSpec — independent spec for 地方税法 Num 321_7_4/2

Needle 「前項の場合において、市町村は、同一の特別徴収対象年金所得者について老齢等年金給付が二以上あるときは、政令で定めるところにより、一の老齢等年金給付（以下この節において「特別徴収対象年金給付」という。）について年金所得に係る特別徴収税額を徴収させるものとする。」.
The implementation uses `threshold ≤ payments`; the independent spec states
the statutory INCLUSIVE lower bound as `2 ≤ payments`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.LocalTax321_7_4TwoAnnuityPaymentsDelegation

open JapanTaxLaw.TaxFinance

def specInScope (payments : Nat) : Prop := 2 ≤ payments

theorem agree_scope (payments : Nat) : inScope payments ↔ specInScope payments := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax321_7_4TwoAnnuityPaymentsDelegation
