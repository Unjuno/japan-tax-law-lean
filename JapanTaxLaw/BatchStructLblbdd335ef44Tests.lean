import JapanTaxLaw.BatchStructLblbdd335ef44Spec

namespace JapanTaxLaw.BatchStructLblbdd335ef44

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblbdd335ef44
