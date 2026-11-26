import JapanTaxLaw.BatchStructLbl135a303a19Spec

namespace JapanTaxLaw.BatchStructLbl135a303a19

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl135a303a19
