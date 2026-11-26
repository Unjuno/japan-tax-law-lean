import JapanTaxLaw.BatchStructLble04e3359b4Spec

namespace JapanTaxLaw.BatchStructLble04e3359b4

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLble04e3359b4
