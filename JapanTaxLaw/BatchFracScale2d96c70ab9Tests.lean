import JapanTaxLaw.BatchFracScale2d96c70ab9Spec

namespace JapanTaxLaw.BatchFracScale2d96c70ab9

example : rate.den = 753 := by decide
example : amount 0 = 0 := by decide
example : amount 753 = 247 := by decide
example : specAmount 753 = amount 753 := agree_spec_impl 753
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScale2d96c70ab9
