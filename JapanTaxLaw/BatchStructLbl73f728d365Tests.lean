import JapanTaxLaw.BatchStructLbl73f728d365Spec

namespace JapanTaxLaw.BatchStructLbl73f728d365

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl73f728d365
