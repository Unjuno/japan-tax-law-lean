import JapanTaxLaw.BatchCommence41e6cef5cdSpec

namespace JapanTaxLaw.BatchCommence41e6cef5cd

example : withinLimit 1 = true := by decide
example : withinLimit (1 + 1) = false := by decide
example : specWithin 1 = withinLimit 1 := agree_spec_impl 1
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence41e6cef5cd
