import JapanTaxLaw.BatchFracScale7fcffca037Spec

namespace JapanTaxLaw.BatchFracScale7fcffca037

example : rate.den = 10 := by decide
example : amount 0 = 0 := by decide
example : amount 10 = 5 := by decide
example : specAmount 10 = amount 10 := agree_spec_impl 10
example : specAmount 1 = amount 1 := agree_spec_impl 1

end JapanTaxLaw.BatchFracScale7fcffca037
