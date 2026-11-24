import JapanTaxLaw.BatchPeriodafc76068cbSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodafc76068cb

example : limit = 1 := by decide
example : specMeets 1 = meets 1 := agree_spec_impl 1
example : specMeets 2 = meets 2 := agree_spec_impl 2
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodafc76068cb
