import JapanTaxLaw.BatchFracScalebe49bd087dSpec

namespace JapanTaxLaw.BatchFracScalebe49bd087d

example : rate.den = 330 := by decide
example : amount 0 = 0 := by decide
example : amount 330 = 200 := by decide
example : specAmount 330 = amount 330 := agree_spec_impl 330
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScalebe49bd087d
