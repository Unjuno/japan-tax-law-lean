import JapanTaxLaw.BatchFracScale0dbc8ed723Spec

namespace JapanTaxLaw.BatchFracScale0dbc8ed723

example : rate.den = 95 := by decide
example : amount 0 = 0 := by decide
example : amount 95 = 100 := by decide
example : specAmount 95 = amount 95 := agree_spec_impl 95
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScale0dbc8ed723
