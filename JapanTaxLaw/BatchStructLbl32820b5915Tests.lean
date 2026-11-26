import JapanTaxLaw.BatchStructLbl32820b5915Spec

namespace JapanTaxLaw.BatchStructLbl32820b5915

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl32820b5915
