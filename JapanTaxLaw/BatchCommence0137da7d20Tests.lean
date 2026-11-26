import JapanTaxLaw.BatchCommence0137da7d20Spec

namespace JapanTaxLaw.BatchCommence0137da7d20

example : withinLimit 6 = true := by decide
example : withinLimit (6 + 1) = false := by decide
example : specWithin 6 = withinLimit 6 := agree_spec_impl 6
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence0137da7d20
