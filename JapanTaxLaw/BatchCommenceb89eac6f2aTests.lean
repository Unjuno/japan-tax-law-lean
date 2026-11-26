import JapanTaxLaw.BatchCommenceb89eac6f2aSpec

namespace JapanTaxLaw.BatchCommenceb89eac6f2a

example : withinLimit 9 = true := by decide
example : withinLimit (9 + 1) = false := by decide
example : specWithin 9 = withinLimit 9 := agree_spec_impl 9
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommenceb89eac6f2a
