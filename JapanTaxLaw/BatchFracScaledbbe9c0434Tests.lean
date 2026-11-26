import JapanTaxLaw.BatchFracScaledbbe9c0434Spec

namespace JapanTaxLaw.BatchFracScaledbbe9c0434

example : rate.den = 3 := by decide
example : amount 0 = 0 := by decide
example : amount 3 = 2 := by decide
example : specAmount 3 = amount 3 := agree_spec_impl 3
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScaledbbe9c0434
