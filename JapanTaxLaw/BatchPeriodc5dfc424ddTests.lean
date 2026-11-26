import JapanTaxLaw.BatchPeriodc5dfc424ddSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodc5dfc424dd

example : limit = 40 := by decide
example : specMeets 40 = meets 40 := agree_spec_impl 40
example : specMeets 41 = meets 41 := agree_spec_impl 41
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodc5dfc424dd
