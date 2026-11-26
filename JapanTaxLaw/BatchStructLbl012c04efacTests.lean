import JapanTaxLaw.BatchStructLbl012c04efacSpec

namespace JapanTaxLaw.BatchStructLbl012c04efac

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl012c04efac
