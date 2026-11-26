import JapanTaxLaw.BatchStructLbl03ccc64ac0Spec

namespace JapanTaxLaw.BatchStructLbl03ccc64ac0

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl03ccc64ac0
