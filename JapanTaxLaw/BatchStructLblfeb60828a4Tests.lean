import JapanTaxLaw.BatchStructLblfeb60828a4Spec

namespace JapanTaxLaw.BatchStructLblfeb60828a4

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblfeb60828a4
