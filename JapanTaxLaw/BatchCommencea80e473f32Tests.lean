import JapanTaxLaw.BatchCommencea80e473f32Spec

namespace JapanTaxLaw.BatchCommencea80e473f32

example : withinLimit 4 = true := by decide
example : withinLimit (4 + 1) = false := by decide
example : specWithin 4 = withinLimit 4 := agree_spec_impl 4
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommencea80e473f32
