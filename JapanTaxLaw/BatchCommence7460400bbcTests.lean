import JapanTaxLaw.BatchCommence7460400bbcSpec

namespace JapanTaxLaw.BatchCommence7460400bbc

example : withinLimit 10 = true := by decide
example : withinLimit (10 + 1) = false := by decide
example : specWithin 10 = withinLimit 10 := agree_spec_impl 10
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence7460400bbc
