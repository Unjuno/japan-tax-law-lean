import JapanTaxLaw.BatchFracScaledc8ed6c0a4Spec

namespace JapanTaxLaw.BatchFracScaledc8ed6c0a4

example : rate.den = 3 := by decide
example : amount 0 = 0 := by decide
example : amount 3 = 2 := by decide
example : specAmount 3 = amount 3 := agree_spec_impl 3
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScaledc8ed6c0a4
