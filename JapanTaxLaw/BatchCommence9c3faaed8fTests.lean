import JapanTaxLaw.BatchCommence9c3faaed8fSpec

namespace JapanTaxLaw.BatchCommence9c3faaed8f

example : withinLimit 9 = true := by decide
example : withinLimit (9 + 1) = false := by decide
example : specWithin 9 = withinLimit 9 := agree_spec_impl 9
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence9c3faaed8f
