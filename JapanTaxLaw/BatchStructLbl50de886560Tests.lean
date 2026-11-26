import JapanTaxLaw.BatchStructLbl50de886560Spec

namespace JapanTaxLaw.BatchStructLbl50de886560

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl50de886560
