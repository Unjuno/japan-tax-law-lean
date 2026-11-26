import JapanTaxLaw.BatchStructLblf021709955Spec

namespace JapanTaxLaw.BatchStructLblf021709955

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblf021709955
