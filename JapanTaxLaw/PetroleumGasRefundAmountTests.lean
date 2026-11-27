import JapanTaxLaw.PetroleumGasRefundAmountSpec

/-! Kernel-decided boundary examples for 石油ガス税法施行規則 art.12(3)(1). -/
namespace JapanTaxLaw.PetroleumGasRefundAmount

example : refundAmount 100 50 1000 = 4000 := by decide
example : refundAmount 100 50 5000 = 0 := by decide
example : refundAmount 100 50 6000 = 0 := by decide
example : refundAmount 0 50 0 = 0 := by decide
example : specRefund 100 50 1000 = 4000 := by decide
example : specRefund 100 50 6000 = 0 := by decide
example : specRefund 100 50 1000 = refundAmount 100 50 1000 := agreeRefund 100 50 1000
example : specRefund 100 50 6000 = refundAmount 100 50 6000 := agreeRefund 100 50 6000
example : refundAmount 100 50 1000 <= 100 * 50 := neverExceedsGross 100 50 1000
example : refundAmount 100 50 6000 = 0 := zeroWhenCreditCoversAll 100 50 6000 (by decide)
example : refundAmount 100 50 1000 <= refundAmount 200 50 1000 := monotoneInWeight 100 200 50 1000 (by decide)

end JapanTaxLaw.PetroleumGasRefundAmount
