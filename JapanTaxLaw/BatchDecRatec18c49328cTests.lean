import JapanTaxLaw.BatchDecRatec18c49328cSpec

namespace JapanTaxLaw.BatchDecRatec18c49328c

example : rate.den = 1000 := by decide
example : amount 0 = 0 := by decide
example : amount 1000 = 907 := by decide
example : specAmount 1_000 = amount 1_000 := agree_spec_impl 1_000
example : specAmount 7 = amount 7 := agree_spec_impl 7

end JapanTaxLaw.BatchDecRatec18c49328c
