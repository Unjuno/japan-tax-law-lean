import JapanTaxLaw.BatchStructLblce188649a2Spec

namespace JapanTaxLaw.BatchStructLblce188649a2

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblce188649a2
