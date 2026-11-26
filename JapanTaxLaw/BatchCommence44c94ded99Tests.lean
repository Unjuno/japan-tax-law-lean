import JapanTaxLaw.BatchCommence44c94ded99Spec

namespace JapanTaxLaw.BatchCommence44c94ded99

example : withinLimit 8 = true := by decide
example : withinLimit (8 + 1) = false := by decide
example : specWithin 8 = withinLimit 8 := agree_spec_impl 8
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence44c94ded99
