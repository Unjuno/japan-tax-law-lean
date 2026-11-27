import JapanTaxLaw.LocalTax718_2TwoAnnuityBenefits

/-
# LocalTax718_2TwoAnnuityBenefitsSpec — independent spec for 地方税法 Num 718_2/2

Needle 「市町村は、同一の特別徴収対象被保険者について老齢等年金給付が二以上ある場合においては、政令で定めるところにより、一の老齢等年金給付（以下この節において「特別徴収対象年金給付」という。）について国民健康保険税を徴収させるものとする。」.
The implementation uses `threshold ≤ benefits`; the independent spec states
the statutory INCLUSIVE lower bound as `2 ≤ benefits`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.LocalTax718_2TwoAnnuityBenefits

open JapanTaxLaw.TaxFinance

def specInScope (benefits : Nat) : Prop := 2 ≤ benefits

theorem agree_scope (benefits : Nat) : inScope benefits ↔ specInScope benefits := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax718_2TwoAnnuityBenefits
