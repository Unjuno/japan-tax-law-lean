import JapanTaxLaw.CapDeductionRefundNorms
import JapanTaxLaw.CapDeductionRefundNormsSpec

/-!
# CapDeductionRefundNormsTests — 金額演算
-/
namespace JapanTaxLaw.CapDeductionRefundNormsTests

open JapanTaxLaw.CapDeductionRefundNorms

theorem cap_spec (a c : Nat) :
    applyCap a c = JapanTaxLaw.CapDeductionRefundNormsSpec.capSpec a c := by rfl

theorem deduct_spec (a d : Nat) :
    deduct a d = JapanTaxLaw.CapDeductionRefundNormsSpec.deductSpec a d := by rfl

theorem refund_spec (p t : Nat) :
    refund p t = JapanTaxLaw.CapDeductionRefundNormsSpec.refundSpec p t := by rfl

theorem add_tax_spec (b r : Nat) :
    addTax b r = JapanTaxLaw.CapDeductionRefundNormsSpec.addTaxSpec b r := by rfl

example (a c : Nat) (h : a <= c) : applyCap a c = a := cap_under a c h
example (a c : Nat) (h : c < a) : applyCap a c = c := cap_over a c h
example (a c : Nat) : applyCap a c <= c := cap_bounded a c
example : deduct 5 5 = 0 := deduct_zero
example (a d : Nat) : deduct a d <= a := deduct_le a d
example (p t : Nat) (h : t <= p) : refund p t = p - t := refund_excess p t h
example (p t : Nat) (h : p < t) : refund p t = 0 := refund_none p t h
example (t : Nat) : exempt t = 0 := exempt_zero t
example (b : Nat) : addTax b 0 = b := add_zero_rate b
example : amountOpDeclared = true := amount_op_is_declaration

end JapanTaxLaw.CapDeductionRefundNormsTests
