import JapanTaxLaw.BatchCommence12050497beSpec

namespace JapanTaxLaw.BatchCommence12050497be

example : withinLimit 5 = true := by decide
example : withinLimit (5 + 1) = false := by decide
example : specWithin 5 = withinLimit 5 := agree_spec_impl 5
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence12050497be
