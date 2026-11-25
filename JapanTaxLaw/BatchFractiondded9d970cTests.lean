import JapanTaxLaw.BatchFractiondded9d970cSpec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.BatchFractiondded9d970c

example : den = 100 := by decide
example : specMeets 0 100 = meets 0 100 := agree_spec_impl 0 100
example : specMeets 1 100 = meets 1 100 := agree_spec_impl 1 100
example : specMeets 2 100 = meets 2 100 := agree_spec_impl 2 100

end JapanTaxLaw.BatchFractiondded9d970c
