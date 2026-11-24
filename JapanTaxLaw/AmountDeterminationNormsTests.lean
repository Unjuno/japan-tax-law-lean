import JapanTaxLaw.AmountDeterminationNorms
import JapanTaxLaw.AmountDeterminationNormsSpec

/-!
# AmountDeterminationNormsTests — 金額の確定
-/
namespace JapanTaxLaw.AmountDeterminationNormsTests
open JapanTaxLaw.AmountDeterminationNorms

theorem determined_spec (d : Determination) (k : Nat) : determinedAmount d k = JapanTaxLaw.AmountDeterminationNormsSpec.determinedAmountSpec d k := by rfl
theorem total_spec (a b : Amount) : totalAmount a b = JapanTaxLaw.AmountDeterminationNormsSpec.totalAmountSpec a b := by rfl
example (d : Determination) (k : Nat) : determinedAmount d k = d k := determination_deterministic d k
example (d : Determination) (k a b : Nat) (ha : a = d k) (hb : b = d k) : a = b := same_key_same_amount d k a b ha hb
example (a b : Amount) : totalAmount a b = a + b := total_is_sum a b
example (a : Amount) : totalAmount a 0 = a := zero_is_noop a
example (a : Amount) : refundAmount a = collectAmount a := refund_collect_same_value a
example : amountDeterminationDeclared = true := amount_determination_is_declaration

end JapanTaxLaw.AmountDeterminationNormsTests
