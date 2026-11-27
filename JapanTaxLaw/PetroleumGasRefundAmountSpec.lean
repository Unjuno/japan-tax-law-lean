import JapanTaxLaw.PetroleumGasRefundAmount

/-! Independent spec uses `gross - min gross credit` instead of direct
saturating subtraction. Universal omega bridge; no conditional, so no
Classical.choice. -/
namespace JapanTaxLaw.PetroleumGasRefundAmount

def specRefund (weight rate credit : Nat) : Nat :=
  (weight * rate) - min (weight * rate) credit

theorem agreeRefund (weight rate credit : Nat) :
    specRefund weight rate credit = refundAmount weight rate credit := by
  unfold specRefund refundAmount
  omega

end JapanTaxLaw.PetroleumGasRefundAmount
