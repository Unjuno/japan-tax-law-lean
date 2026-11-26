import JapanTaxLaw.BatchFracScalee65f8d3dfdSpec

namespace JapanTaxLaw.BatchFracScalee65f8d3dfd

example : rate.den = 4 := by decide
example : amount 0 = 0 := by decide
example : amount 4 = 3 := by decide
example : specAmount 4 = amount 4 := agree_spec_impl 4
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScalee65f8d3dfd
