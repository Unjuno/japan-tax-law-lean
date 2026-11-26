import JapanTaxLaw.BatchStructLble92b47d846Spec

namespace JapanTaxLaw.BatchStructLble92b47d846

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLble92b47d846
