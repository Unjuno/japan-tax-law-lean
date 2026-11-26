import JapanTaxLaw.BatchCommence7795e3d52cSpec

namespace JapanTaxLaw.BatchCommence7795e3d52c

example : withinLimit 6 = true := by decide
example : withinLimit (6 + 1) = false := by decide
example : specWithin 6 = withinLimit 6 := agree_spec_impl 6
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence7795e3d52c
