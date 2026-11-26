import JapanTaxLaw.BatchStructLblfcd3fab1b1Spec

namespace JapanTaxLaw.BatchStructLblfcd3fab1b1

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblfcd3fab1b1
