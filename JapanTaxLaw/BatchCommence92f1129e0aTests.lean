import JapanTaxLaw.BatchCommence92f1129e0aSpec

namespace JapanTaxLaw.BatchCommence92f1129e0a

example : withinLimit 1 = true := by decide
example : withinLimit (1 + 1) = false := by decide
example : specWithin 1 = withinLimit 1 := agree_spec_impl 1
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence92f1129e0a
