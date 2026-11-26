import JapanTaxLaw.BatchStructLblfcc1ddab7fSpec

namespace JapanTaxLaw.BatchStructLblfcc1ddab7f

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblfcc1ddab7f
