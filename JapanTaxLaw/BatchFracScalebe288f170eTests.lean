import JapanTaxLaw.BatchFracScalebe288f170eSpec

namespace JapanTaxLaw.BatchFracScalebe288f170e

example : rate.den = 78 := by decide
example : amount 0 = 0 := by decide
example : amount 78 = 22 := by decide
example : specAmount 78 = amount 78 := agree_spec_impl 78
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScalebe288f170e
