import JapanTaxLaw.BatchStructLblcd02e73efbSpec

namespace JapanTaxLaw.BatchStructLblcd02e73efb

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblcd02e73efb
