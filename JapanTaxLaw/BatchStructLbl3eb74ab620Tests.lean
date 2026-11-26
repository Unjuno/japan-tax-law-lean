import JapanTaxLaw.BatchStructLbl3eb74ab620Spec

namespace JapanTaxLaw.BatchStructLbl3eb74ab620

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl3eb74ab620
