import JapanTaxLaw.BatchStructLblfc4735880aSpec

namespace JapanTaxLaw.BatchStructLblfc4735880a

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblfc4735880a
