import JapanTaxLaw.BatchStructLblcc31430096Spec

namespace JapanTaxLaw.BatchStructLblcc31430096

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblcc31430096
