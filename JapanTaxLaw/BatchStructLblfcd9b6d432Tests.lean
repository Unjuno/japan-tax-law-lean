import JapanTaxLaw.BatchStructLblfcd9b6d432Spec

namespace JapanTaxLaw.BatchStructLblfcd9b6d432

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblfcd9b6d432
