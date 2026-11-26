import JapanTaxLaw.BatchCommencea4c2a6a25dSpec

namespace JapanTaxLaw.BatchCommencea4c2a6a25d

example : withinLimit 2 = true := by decide
example : withinLimit (2 + 1) = false := by decide
example : specWithin 2 = withinLimit 2 := agree_spec_impl 2
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommencea4c2a6a25d
