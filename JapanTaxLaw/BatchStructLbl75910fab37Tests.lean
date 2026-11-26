import JapanTaxLaw.BatchStructLbl75910fab37Spec

namespace JapanTaxLaw.BatchStructLbl75910fab37

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl75910fab37
