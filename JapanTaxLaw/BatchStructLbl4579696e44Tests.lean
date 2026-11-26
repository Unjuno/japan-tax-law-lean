import JapanTaxLaw.BatchStructLbl4579696e44Spec

namespace JapanTaxLaw.BatchStructLbl4579696e44

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl4579696e44
