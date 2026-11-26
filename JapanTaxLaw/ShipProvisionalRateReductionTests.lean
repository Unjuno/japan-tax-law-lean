import JapanTaxLaw.ShipProvisionalRateReductionSpec

/-! Kernel-decided boundary examples for 登録免許税法 art.17(2). -/
namespace JapanTaxLaw.ShipProvisionalRateReduction

example : reducedRate 4 = 0 := by decide
example : reducedRate 10 = 6 := by decide
example : reducedRate 0 = 0 := by decide
example : reducedRate 3 = 0 := by decide
example : specReducedRate 4 = 0 := by decide
example : specReducedRate 10 = 6 := by decide
example : specReducedRate 4 = reducedRate 4 := agreeReducedRate 4
example : specReducedRate 10 = reducedRate 10 := agreeReducedRate 10
example : reducedRate 10 <= 10 := neverExceedsBase 10
example : reducedRate 3 = 0 := zeroWhenBaseAtMostReduction 3 (by decide)
example : reducedRate 4 <= reducedRate 10 := monotoneInBase 4 10 (by decide)

end JapanTaxLaw.ShipProvisionalRateReduction
