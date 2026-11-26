import JapanTaxLaw.BatchStructLbl1940ec1167Spec

namespace JapanTaxLaw.BatchStructLbl1940ec1167

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl1940ec1167
