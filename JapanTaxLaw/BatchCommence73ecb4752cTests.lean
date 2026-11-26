import JapanTaxLaw.BatchCommence73ecb4752cSpec

namespace JapanTaxLaw.BatchCommence73ecb4752c

example : withinLimit 1 = true := by decide
example : withinLimit (1 + 1) = false := by decide
example : specWithin 1 = withinLimit 1 := agree_spec_impl 1
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence73ecb4752c
