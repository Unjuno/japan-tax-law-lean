import JapanTaxLaw.BatchStructLbl163b265d61Spec

namespace JapanTaxLaw.BatchStructLbl163b265d61

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl163b265d61
