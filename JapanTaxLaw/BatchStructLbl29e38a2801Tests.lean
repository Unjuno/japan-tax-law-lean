import JapanTaxLaw.BatchStructLbl29e38a2801Spec

namespace JapanTaxLaw.BatchStructLbl29e38a2801

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl29e38a2801
