import JapanTaxLaw.BatchFracScale2b343fc160Spec

namespace JapanTaxLaw.BatchFracScale2b343fc160

example : rate.den = 78 := by decide
example : amount 0 = 0 := by decide
example : amount 78 = 22 := by decide
example : specAmount 78 = amount 78 := agree_spec_impl 78
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScale2b343fc160
