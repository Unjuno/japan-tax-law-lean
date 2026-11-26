import JapanTaxLaw.BatchFracScale0ed9c0d5e4Spec

namespace JapanTaxLaw.BatchFracScale0ed9c0d5e4

example : rate.den = 22 := by decide
example : amount 0 = 0 := by decide
example : amount 22 = 12 := by decide
example : specAmount 22 = amount 22 := agree_spec_impl 22
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScale0ed9c0d5e4
