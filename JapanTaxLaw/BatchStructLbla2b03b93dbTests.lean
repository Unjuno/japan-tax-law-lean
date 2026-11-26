import JapanTaxLaw.BatchStructLbla2b03b93dbSpec

namespace JapanTaxLaw.BatchStructLbla2b03b93db

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbla2b03b93db
