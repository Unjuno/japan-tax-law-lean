import JapanTaxLaw.BatchCommence4bf2b0074aSpec

namespace JapanTaxLaw.BatchCommence4bf2b0074a

example : withinLimit 9 = true := by decide
example : withinLimit (9 + 1) = false := by decide
example : specWithin 9 = withinLimit 9 := agree_spec_impl 9
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence4bf2b0074a
