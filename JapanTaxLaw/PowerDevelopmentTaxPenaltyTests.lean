import JapanTaxLaw.PowerDevelopmentTaxPenaltySpec

/-! Boundary examples for 電源開発促進税法 art.12(4) (kernel-decided). -/

namespace JapanTaxLaw.PowerDevelopmentTaxPenalty

open JapanTaxLaw.TaxFinance

example : upperFine 0 = 500_000 := by decide
example : upperFine 1 = 500_000 := by decide
example : upperFine 499_999 = 500_000 := by decide
example : upperFine 500_000 = 500_000 := by decide
example : upperFine 500_001 = 500_001 := by decide
example : upperFine 1_000_000 = 1_000_000 := by decide
example : specUpper 499_999 = 500_000 := by decide
example : specUpper 500_001 = 500_001 := by decide
example : specUpper 499_999 = upperFine 499_999 := agreeUpper 499_999
example : specUpper 500_001 = upperFine 500_001 := agreeUpper 500_001

end JapanTaxLaw.PowerDevelopmentTaxPenalty
