import JapanTaxLaw.BatchStructLbl84b917e4b5Spec

namespace JapanTaxLaw.BatchStructLbl84b917e4b5

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl84b917e4b5
