import JapanTaxLaw.DoubtfulReceivableDeductionSpec

/-! Kernel-decided boundary examples for 税理士法人会計帳簿省令 art.22-3(6). -/
namespace JapanTaxLaw.DoubtfulReceivableDeduction

example : bookedAmount 1000 300 = 700 := by decide
example : bookedAmount 1000 1000 = 0 := by decide
example : bookedAmount 1000 1200 = 0 := by decide
example : bookedAmount 0 0 = 0 := by decide
example : specBooked 1000 300 = 700 := by decide
example : specBooked 1000 1200 = 0 := by decide
example : specBooked 1000 300 = bookedAmount 1000 300 := agreeBookedAmount 1000 300
example : specBooked 1000 1200 = bookedAmount 1000 1200 := agreeBookedAmount 1000 1200
example : bookedAmount 1000 300 <= 1000 := neverExceedsReceivable 1000 300
example : bookedAmount 1000 1200 = 0 := zeroWhenEstimateCoversAll 1000 1200 (by decide)
example : bookedAmount 1000 1200 <= bookedAmount 1000 300 := monotoneInEstimate 1000 300 1200 (by decide)

end JapanTaxLaw.DoubtfulReceivableDeduction
