import JapanTaxLaw.BatchStructLble1351cbf68Spec

namespace JapanTaxLaw.BatchStructLble1351cbf68

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLble1351cbf68
