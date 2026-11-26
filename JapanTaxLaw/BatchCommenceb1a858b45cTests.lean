import JapanTaxLaw.BatchCommenceb1a858b45cSpec

namespace JapanTaxLaw.BatchCommenceb1a858b45c

example : withinLimit 6 = true := by decide
example : withinLimit (6 + 1) = false := by decide
example : specWithin 6 = withinLimit 6 := agree_spec_impl 6
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommenceb1a858b45c
