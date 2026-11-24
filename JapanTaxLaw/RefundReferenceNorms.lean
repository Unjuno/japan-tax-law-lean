/-\!
# RefundReferenceNorms — 還付金の参照（…る還付金）40 units, PROVED_SCOPE

40 clauses across tax laws ending 「…る還付金。」— each references a refund amount
arising under a provision (e.g. 「前項の規定による還付金」, 「中間納付額が還付される
こととなつた場合における還付金」). Only the refund-reference structure is kernel-proven
(a refund is a Nat amount; a refund reduces an overpayment to zero or leaves a
balance; refunds from distinct provisions compose additively); the concrete amounts,
provisions and overpayments are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.RefundReferenceNorms

-- 金額は自然数
abbrev Amount := Nat

-- 還付：過払額から還付額を差し引く（残額）
def refundRemainder (overpaid refunded : Amount) : Amount := overpaid - refunded
theorem full_refund_zero_remainder (overpaid : Amount) : refundRemainder overpaid overpaid = 0 := by
  unfold refundRemainder
  exact Nat.sub_self overpaid
theorem refund_bounded (overpaid refunded : Amount) : refundRemainder overpaid refunded <= overpaid := by
  unfold refundRemainder
  exact Nat.sub_le overpaid refunded

-- 複数還付の合算（異なる規定による還付の合成）
def combineRefunds (a b : Amount) : Amount := a + b
theorem combine_is_sum (a b : Amount) : combineRefunds a b = a + b := rfl
theorem zero_refund_noop (a : Amount) : combineRefunds a 0 = a := by unfold combineRefunds; exact Nat.add_zero a

def refundReferenceDeclared : Bool := true
theorem refund_reference_is_declaration : refundReferenceDeclared = true := rfl

end JapanTaxLaw.RefundReferenceNorms
