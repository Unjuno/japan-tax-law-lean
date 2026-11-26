import JapanTaxLaw.BatchFracScalefb8a1fb61bSpec

namespace JapanTaxLaw.BatchFracScalefb8a1fb61b

example : rate.den = 2 := by decide
example : amount 0 = 0 := by decide
example : amount 2 = 1 := by decide
example : specAmount 2 = amount 2 := agree_spec_impl 2
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScalefb8a1fb61b
