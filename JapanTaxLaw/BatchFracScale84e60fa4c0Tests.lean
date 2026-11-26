import JapanTaxLaw.BatchFracScale84e60fa4c0Spec

namespace JapanTaxLaw.BatchFracScale84e60fa4c0

example : rate.den = 5 := by decide
example : amount 0 = 0 := by decide
example : amount 5 = 3 := by decide
example : specAmount 5 = amount 5 := agree_spec_impl 5
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScale84e60fa4c0
