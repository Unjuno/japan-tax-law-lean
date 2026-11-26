import JapanTaxLaw.BatchCommencee71c86c603Spec

namespace JapanTaxLaw.BatchCommencee71c86c603

example : withinLimit 3 = true := by decide
example : withinLimit (3 + 1) = false := by decide
example : specWithin 3 = withinLimit 3 := agree_spec_impl 3
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommencee71c86c603
