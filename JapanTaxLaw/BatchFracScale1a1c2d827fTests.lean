import JapanTaxLaw.BatchFracScale1a1c2d827fSpec

namespace JapanTaxLaw.BatchFracScale1a1c2d827f

example : rate.den = 2 := by decide
example : amount 0 = 0 := by decide
example : amount 2 = 1 := by decide
example : specAmount 2 = amount 2 := agree_spec_impl 2
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScale1a1c2d827f
