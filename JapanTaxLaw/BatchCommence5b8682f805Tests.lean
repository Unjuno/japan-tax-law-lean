import JapanTaxLaw.BatchCommence5b8682f805Spec

namespace JapanTaxLaw.BatchCommence5b8682f805

example : withinLimit 6 = true := by decide
example : withinLimit (6 + 1) = false := by decide
example : specWithin 6 = withinLimit 6 := agree_spec_impl 6
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence5b8682f805
