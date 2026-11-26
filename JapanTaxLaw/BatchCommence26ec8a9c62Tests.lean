import JapanTaxLaw.BatchCommence26ec8a9c62Spec

namespace JapanTaxLaw.BatchCommence26ec8a9c62

example : withinLimit 6 = true := by decide
example : withinLimit (6 + 1) = false := by decide
example : specWithin 6 = withinLimit 6 := agree_spec_impl 6
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence26ec8a9c62
