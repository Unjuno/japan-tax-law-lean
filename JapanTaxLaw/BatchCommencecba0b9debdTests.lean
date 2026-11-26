import JapanTaxLaw.BatchCommencecba0b9debdSpec

namespace JapanTaxLaw.BatchCommencecba0b9debd

example : withinLimit 3 = true := by decide
example : withinLimit (3 + 1) = false := by decide
example : specWithin 3 = withinLimit 3 := agree_spec_impl 3
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommencecba0b9debd
