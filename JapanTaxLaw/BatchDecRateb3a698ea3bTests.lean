import JapanTaxLaw.BatchDecRateb3a698ea3bSpec

namespace JapanTaxLaw.BatchDecRateb3a698ea3b

example : rate.den = 1000 := by decide
example : amount 0 = 0 := by decide
example : amount 1000 = 232 := by decide
example : specAmount 1_000 = amount 1_000 := agree_spec_impl 1_000
example : specAmount 7 = amount 7 := agree_spec_impl 7

end JapanTaxLaw.BatchDecRateb3a698ea3b
