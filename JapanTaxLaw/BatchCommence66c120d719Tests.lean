import JapanTaxLaw.BatchCommence66c120d719Spec

namespace JapanTaxLaw.BatchCommence66c120d719

example : withinLimit 6 = true := by decide
example : withinLimit (6 + 1) = false := by decide
example : specWithin 6 = withinLimit 6 := agree_spec_impl 6
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence66c120d719
