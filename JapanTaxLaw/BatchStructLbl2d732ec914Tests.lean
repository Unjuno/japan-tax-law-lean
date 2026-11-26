import JapanTaxLaw.BatchStructLbl2d732ec914Spec

namespace JapanTaxLaw.BatchStructLbl2d732ec914

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl2d732ec914
