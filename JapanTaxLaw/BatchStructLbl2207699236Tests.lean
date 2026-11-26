import JapanTaxLaw.BatchStructLbl2207699236Spec

namespace JapanTaxLaw.BatchStructLbl2207699236

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl2207699236
