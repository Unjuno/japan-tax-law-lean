import JapanTaxLaw.BatchDecRated7b70f4ff3Spec

namespace JapanTaxLaw.BatchDecRated7b70f4ff3

example : rate.den = 1000 := by decide
example : amount 0 = 0 := by decide
example : amount 1000 = 3 := by decide
example : specAmount 1_000 = amount 1_000 := agree_spec_impl 1_000
example : specAmount 7 = amount 7 := agree_spec_impl 7

end JapanTaxLaw.BatchDecRated7b70f4ff3
