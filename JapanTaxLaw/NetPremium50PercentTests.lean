import JapanTaxLaw.NetPremium50Percent

/-! # NetPremium50Percent tests — 50%算定 (law 332CO0000000043 / art.33の3) -/

namespace JapanTaxLaw.NetPremium50Percent

example : amount 0 = 0 := by decide
example : amount 1 = 0 := by decide
example : amount 99 = 49 := by decide
example : amount 100 = 50 := by decide
example : amount 101 = 50 := by decide
example : amount 1_000 = 500 := by decide
example : amount 10_001 = 5_000 := by decide

end JapanTaxLaw.NetPremium50Percent
