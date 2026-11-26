import JapanTaxLaw.BatchStructLbl1dec93bfbbSpec

namespace JapanTaxLaw.BatchStructLbl1dec93bfbb

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl1dec93bfbb
