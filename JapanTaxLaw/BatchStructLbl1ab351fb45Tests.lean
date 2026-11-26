import JapanTaxLaw.BatchStructLbl1ab351fb45Spec

namespace JapanTaxLaw.BatchStructLbl1ab351fb45

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl1ab351fb45
