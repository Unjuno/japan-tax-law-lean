import JapanTaxLaw.BatchStructLbl74fde31880Spec

namespace JapanTaxLaw.BatchStructLbl74fde31880

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl74fde31880
