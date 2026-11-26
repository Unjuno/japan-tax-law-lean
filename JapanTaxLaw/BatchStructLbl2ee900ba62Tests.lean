import JapanTaxLaw.BatchStructLbl2ee900ba62Spec

namespace JapanTaxLaw.BatchStructLbl2ee900ba62

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl2ee900ba62
