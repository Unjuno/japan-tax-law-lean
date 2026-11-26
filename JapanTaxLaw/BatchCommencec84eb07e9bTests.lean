import JapanTaxLaw.BatchCommencec84eb07e9bSpec

namespace JapanTaxLaw.BatchCommencec84eb07e9b

example : withinLimit 6 = true := by decide
example : withinLimit (6 + 1) = false := by decide
example : specWithin 6 = withinLimit 6 := agree_spec_impl 6
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommencec84eb07e9b
