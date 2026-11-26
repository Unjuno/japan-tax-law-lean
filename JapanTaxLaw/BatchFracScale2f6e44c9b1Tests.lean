import JapanTaxLaw.BatchFracScale2f6e44c9b1Spec

namespace JapanTaxLaw.BatchFracScale2f6e44c9b1

example : rate.den = 17 := by decide
example : amount 0 = 0 := by decide
example : amount 17 = 10 := by decide
example : specAmount 17 = amount 17 := agree_spec_impl 17
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScale2f6e44c9b1
