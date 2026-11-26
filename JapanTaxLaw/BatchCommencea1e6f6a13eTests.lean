import JapanTaxLaw.BatchCommencea1e6f6a13eSpec

namespace JapanTaxLaw.BatchCommencea1e6f6a13e

example : withinLimit 1 = true := by decide
example : withinLimit (1 + 1) = false := by decide
example : specWithin 1 = withinLimit 1 := agree_spec_impl 1
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommencea1e6f6a13e
