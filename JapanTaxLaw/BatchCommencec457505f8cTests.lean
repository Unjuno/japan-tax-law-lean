import JapanTaxLaw.BatchCommencec457505f8cSpec

namespace JapanTaxLaw.BatchCommencec457505f8c

example : withinLimit 3 = true := by decide
example : withinLimit (3 + 1) = false := by decide
example : specWithin 3 = withinLimit 3 := agree_spec_impl 3
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommencec457505f8c
