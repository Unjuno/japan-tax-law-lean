import JapanTaxLaw.BatchCommencea287991460Spec

namespace JapanTaxLaw.BatchCommencea287991460

example : withinLimit 6 = true := by decide
example : withinLimit (6 + 1) = false := by decide
example : specWithin 6 = withinLimit 6 := agree_spec_impl 6
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommencea287991460
