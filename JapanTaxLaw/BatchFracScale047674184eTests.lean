import JapanTaxLaw.BatchFracScale047674184eSpec

namespace JapanTaxLaw.BatchFracScale047674184e

example : rate.den = 10 := by decide
example : amount 0 = 0 := by decide
example : amount 10 = 1 := by decide
example : specAmount 10 = amount 10 := agree_spec_impl 10
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScale047674184e
