import JapanTaxLaw.BatchStructLblbbb131b908Spec

namespace JapanTaxLaw.BatchStructLblbbb131b908

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblbbb131b908
