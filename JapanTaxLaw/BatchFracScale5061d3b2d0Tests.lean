import JapanTaxLaw.BatchFracScale5061d3b2d0Spec

namespace JapanTaxLaw.BatchFracScale5061d3b2d0

example : rate.den = 3 := by decide
example : amount 0 = 0 := by decide
example : amount 3 = 2 := by decide
example : specAmount 3 = amount 3 := agree_spec_impl 3
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScale5061d3b2d0
