import JapanTaxLaw.BatchStructLblc030c9fc92Spec

namespace JapanTaxLaw.BatchStructLblc030c9fc92

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblc030c9fc92
