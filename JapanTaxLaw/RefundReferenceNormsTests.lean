import JapanTaxLaw.RefundReferenceNorms
import JapanTaxLaw.RefundReferenceNormsSpec

/-!
# RefundReferenceNormsTests — 還付金の参照
-/
namespace JapanTaxLaw.RefundReferenceNormsTests
open JapanTaxLaw.RefundReferenceNorms

theorem remainder_spec (o r : Amount) : refundRemainder o r = JapanTaxLaw.RefundReferenceNormsSpec.refundRemainderSpec o r := by rfl
theorem combine_spec (a b : Amount) : combineRefunds a b = JapanTaxLaw.RefundReferenceNormsSpec.combineRefundsSpec a b := by rfl
example (o : Amount) : refundRemainder o o = 0 := full_refund_zero_remainder o
example (o r : Amount) : refundRemainder o r <= o := refund_bounded o r
example (a b : Amount) : combineRefunds a b = a + b := combine_is_sum a b
example (a : Amount) : combineRefunds a 0 = a := zero_refund_noop a
example : refundReferenceDeclared = true := refund_reference_is_declaration

end JapanTaxLaw.RefundReferenceNormsTests
