import JapanTaxLaw.BatchStructLbl155d3b9380Spec

namespace JapanTaxLaw.BatchStructLbl155d3b9380

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl155d3b9380
