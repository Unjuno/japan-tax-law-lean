import JapanTaxLaw.BatchDecRatee5c4392eb9Spec

namespace JapanTaxLaw.BatchDecRatee5c4392eb9

example : rate.den = 1000 := by decide
example : amount 0 = 0 := by decide
example : amount 1000 = 14 := by decide
example : specAmount 1_000 = amount 1_000 := agree_spec_impl 1_000
example : specAmount 7 = amount 7 := agree_spec_impl 7

end JapanTaxLaw.BatchDecRatee5c4392eb9
