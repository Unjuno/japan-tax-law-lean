import JapanTaxLaw.BatchStructLblc701b90ba1Spec

namespace JapanTaxLaw.BatchStructLblc701b90ba1

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblc701b90ba1
