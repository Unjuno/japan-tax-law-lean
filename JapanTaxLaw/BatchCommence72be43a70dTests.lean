import JapanTaxLaw.BatchCommence72be43a70dSpec

namespace JapanTaxLaw.BatchCommence72be43a70d

example : withinLimit 10 = true := by decide
example : withinLimit (10 + 1) = false := by decide
example : specWithin 10 = withinLimit 10 := agree_spec_impl 10
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence72be43a70d
