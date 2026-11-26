import JapanTaxLaw.BatchCommence5846e8f3b6Spec

namespace JapanTaxLaw.BatchCommence5846e8f3b6

example : withinLimit 1 = true := by decide
example : withinLimit (1 + 1) = false := by decide
example : specWithin 1 = withinLimit 1 := agree_spec_impl 1
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
end JapanTaxLaw.BatchCommence5846e8f3b6
