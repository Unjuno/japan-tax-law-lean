import JapanTaxLaw.BatchCommence29ff0211c6Spec

namespace JapanTaxLaw.BatchCommence29ff0211c6

example : withinLimit 3 = true := by decide
example : withinLimit (3 + 1) = false := by decide
example : specWithin 3 = withinLimit 3 := agree_spec_impl 3
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence29ff0211c6
