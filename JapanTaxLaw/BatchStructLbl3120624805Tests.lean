import JapanTaxLaw.BatchStructLbl3120624805Spec

namespace JapanTaxLaw.BatchStructLbl3120624805

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl3120624805
