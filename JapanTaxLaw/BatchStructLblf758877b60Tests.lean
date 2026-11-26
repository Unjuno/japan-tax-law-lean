import JapanTaxLaw.BatchStructLblf758877b60Spec

namespace JapanTaxLaw.BatchStructLblf758877b60

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblf758877b60
