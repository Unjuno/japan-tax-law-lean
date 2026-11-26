import JapanTaxLaw.BatchCommence9a8a6ee506Spec

namespace JapanTaxLaw.BatchCommence9a8a6ee506

example : withinLimit 3 = true := by decide
example : withinLimit (3 + 1) = false := by decide
example : specWithin 3 = withinLimit 3 := agree_spec_impl 3
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence9a8a6ee506
