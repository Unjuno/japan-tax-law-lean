import JapanTaxLaw.BatchFracScale4c2ea748daSpec

namespace JapanTaxLaw.BatchFracScale4c2ea748da

example : rate.den = 4 := by decide
example : amount 0 = 0 := by decide
example : amount 4 = 1 := by decide
example : specAmount 4 = amount 4 := agree_spec_impl 4
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScale4c2ea748da
