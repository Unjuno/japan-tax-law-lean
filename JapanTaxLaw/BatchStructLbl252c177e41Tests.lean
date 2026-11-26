import JapanTaxLaw.BatchStructLbl252c177e41Spec

namespace JapanTaxLaw.BatchStructLbl252c177e41

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl252c177e41
