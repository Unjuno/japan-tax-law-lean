import JapanTaxLaw.BatchFracScale54b6262200Spec

namespace JapanTaxLaw.BatchFracScale54b6262200

example : rate.den = 907 := by decide
example : amount 0 = 0 := by decide
example : amount 907 = 93 := by decide
example : specAmount 907 = amount 907 := agree_spec_impl 907
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScale54b6262200
