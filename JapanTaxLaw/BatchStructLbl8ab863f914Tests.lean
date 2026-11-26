import JapanTaxLaw.BatchStructLbl8ab863f914Spec

namespace JapanTaxLaw.BatchStructLbl8ab863f914

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl8ab863f914
