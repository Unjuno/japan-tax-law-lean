import JapanTaxLaw.BatchFracScalefd8f206493Spec

namespace JapanTaxLaw.BatchFracScalefd8f206493

example : rate.den = 1000 := by decide
example : amount 0 = 0 := by decide
example : amount 1000 = 3 := by decide
example : specAmount 1000 = amount 1000 := agree_spec_impl 1000
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScalefd8f206493
