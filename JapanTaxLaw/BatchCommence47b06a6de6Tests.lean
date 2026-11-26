import JapanTaxLaw.BatchCommence47b06a6de6Spec

namespace JapanTaxLaw.BatchCommence47b06a6de6

example : withinLimit 2 = true := by decide
example : withinLimit (2 + 1) = false := by decide
example : specWithin 2 = withinLimit 2 := agree_spec_impl 2
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence47b06a6de6
