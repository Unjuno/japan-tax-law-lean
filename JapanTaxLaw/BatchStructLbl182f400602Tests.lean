import JapanTaxLaw.BatchStructLbl182f400602Spec

namespace JapanTaxLaw.BatchStructLbl182f400602

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl182f400602
