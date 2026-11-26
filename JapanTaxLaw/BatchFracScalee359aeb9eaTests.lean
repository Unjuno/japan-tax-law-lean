import JapanTaxLaw.BatchFracScalee359aeb9eaSpec

namespace JapanTaxLaw.BatchFracScalee359aeb9ea

example : rate.den = 10 := by decide
example : amount 0 = 0 := by decide
example : amount 10 = 7 := by decide
example : specAmount 10 = amount 10 := agree_spec_impl 10
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScalee359aeb9ea
