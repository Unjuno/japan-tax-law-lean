import JapanTaxLaw.BatchPeriodbcbd2d27a5Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodbcbd2d27a5

example : limit = 35 := by decide
example : specMeets 35 = meets 35 := agree_spec_impl 35
example : specMeets 36 = meets 36 := agree_spec_impl 36
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodbcbd2d27a5
