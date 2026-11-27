import JapanTaxLaw.LocalTax321_7_4TwoAnnuityPaymentsDelegationSpec

/- Kernel-decided boundary checks for 「前項の場合において、市町村は、同一の特別徴収対象年金所得者について老齢等年金給付が二以上あるときは、政令で定めるところにより、一の老齢等年金給付（以下この節において「特別徴収対象年金給付」という。）について年金所得に係る特別徴収税額を徴収させるものとする。」. -/
namespace JapanTaxLaw.LocalTax321_7_4TwoAnnuityPaymentsDelegation

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : inScope 3 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = true := by decide  -- bool
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax321_7_4TwoAnnuityPaymentsDelegation
