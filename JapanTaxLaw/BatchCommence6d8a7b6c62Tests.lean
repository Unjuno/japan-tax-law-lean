import JapanTaxLaw.BatchCommence6d8a7b6c62Spec

namespace JapanTaxLaw.BatchCommence6d8a7b6c62

example : withinLimit 1 = true := by decide
example : withinLimit (1 + 1) = false := by decide
example : specWithin 1 = withinLimit 1 := agree_spec_impl 1
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence6d8a7b6c62
