import JapanTaxLaw.BatchStructLbl603a1c6881Spec

namespace JapanTaxLaw.BatchStructLbl603a1c6881

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl603a1c6881
