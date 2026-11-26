import JapanTaxLaw.BatchFracScale090677efa2Spec

namespace JapanTaxLaw.BatchFracScale090677efa2

example : rate.den = 5 := by decide
example : amount 0 = 0 := by decide
example : amount 5 = 4 := by decide
example : specAmount 5 = amount 5 := agree_spec_impl 5
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScale090677efa2
