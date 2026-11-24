import JapanTaxLaw.BatchPeriod089360e511Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod089360e511

example : limit = 2 := by decide
example : specMeets 2 = meets 2 := agree_spec_impl 2
example : specMeets 3 = meets 3 := agree_spec_impl 3
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod089360e511
