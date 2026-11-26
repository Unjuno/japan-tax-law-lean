import JapanTaxLaw.BatchStructLbl03c58fe834Spec

namespace JapanTaxLaw.BatchStructLbl03c58fe834

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl03c58fe834
