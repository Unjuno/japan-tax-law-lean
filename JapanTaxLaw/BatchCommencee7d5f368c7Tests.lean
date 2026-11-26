import JapanTaxLaw.BatchCommencee7d5f368c7Spec

namespace JapanTaxLaw.BatchCommencee7d5f368c7

example : withinLimit 1 = true := by decide
example : withinLimit (1 + 1) = false := by decide
example : specWithin 1 = withinLimit 1 := agree_spec_impl 1
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommencee7d5f368c7
