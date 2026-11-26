import JapanTaxLaw.BatchStructLblcbe6066c83Spec

namespace JapanTaxLaw.BatchStructLblcbe6066c83

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblcbe6066c83
