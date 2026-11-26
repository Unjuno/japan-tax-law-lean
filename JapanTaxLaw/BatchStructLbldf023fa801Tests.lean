import JapanTaxLaw.BatchStructLbldf023fa801Spec

namespace JapanTaxLaw.BatchStructLbldf023fa801

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbldf023fa801
