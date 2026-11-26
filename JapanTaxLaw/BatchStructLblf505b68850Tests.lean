import JapanTaxLaw.BatchStructLblf505b68850Spec

namespace JapanTaxLaw.BatchStructLblf505b68850

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblf505b68850
