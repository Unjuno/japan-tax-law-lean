import JapanTaxLaw.BatchCommence5268860271Spec

namespace JapanTaxLaw.BatchCommence5268860271

example : withinLimit 2 = true := by decide
example : withinLimit (2 + 1) = false := by decide
example : specWithin 2 = withinLimit 2 := agree_spec_impl 2
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence5268860271
