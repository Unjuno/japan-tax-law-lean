import JapanTaxLaw.BatchStructLbl75613aec52Spec

namespace JapanTaxLaw.BatchStructLbl75613aec52

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl75613aec52
