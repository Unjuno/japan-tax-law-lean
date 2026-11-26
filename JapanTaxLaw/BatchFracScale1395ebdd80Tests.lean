import JapanTaxLaw.BatchFracScale1395ebdd80Spec

namespace JapanTaxLaw.BatchFracScale1395ebdd80

example : rate.den = 105 := by decide
example : amount 0 = 0 := by decide
example : amount 105 = 4 := by decide
example : specAmount 105 = amount 105 := agree_spec_impl 105
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScale1395ebdd80
