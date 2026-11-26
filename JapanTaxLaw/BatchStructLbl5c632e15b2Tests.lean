import JapanTaxLaw.BatchStructLbl5c632e15b2Spec

namespace JapanTaxLaw.BatchStructLbl5c632e15b2

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl5c632e15b2
