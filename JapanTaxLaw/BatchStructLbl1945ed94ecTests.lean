import JapanTaxLaw.BatchStructLbl1945ed94ecSpec

namespace JapanTaxLaw.BatchStructLbl1945ed94ec

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl1945ed94ec
