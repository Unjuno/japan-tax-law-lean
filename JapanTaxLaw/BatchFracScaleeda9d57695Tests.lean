import JapanTaxLaw.BatchFracScaleeda9d57695Spec

namespace JapanTaxLaw.BatchFracScaleeda9d57695

example : rate.den = 17 := by decide
example : amount 0 = 0 := by decide
example : amount 17 = 10 := by decide
example : specAmount 17 = amount 17 := agree_spec_impl 17
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScaleeda9d57695
