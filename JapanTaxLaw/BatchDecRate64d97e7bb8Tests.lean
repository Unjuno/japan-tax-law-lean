import JapanTaxLaw.BatchDecRate64d97e7bb8Spec

namespace JapanTaxLaw.BatchDecRate64d97e7bb8

example : rate.den = 1000 := by decide
example : amount 0 = 0 := by decide
example : amount 1000 = 103 := by decide
example : specAmount 1_000 = amount 1_000 := agree_spec_impl 1_000
example : specAmount 7 = amount 7 := agree_spec_impl 7

end JapanTaxLaw.BatchDecRate64d97e7bb8
