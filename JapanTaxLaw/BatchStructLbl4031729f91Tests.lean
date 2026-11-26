import JapanTaxLaw.BatchStructLbl4031729f91Spec

namespace JapanTaxLaw.BatchStructLbl4031729f91

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl4031729f91
