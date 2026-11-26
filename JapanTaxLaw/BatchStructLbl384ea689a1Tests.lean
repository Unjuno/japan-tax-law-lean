import JapanTaxLaw.BatchStructLbl384ea689a1Spec

namespace JapanTaxLaw.BatchStructLbl384ea689a1

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl384ea689a1
