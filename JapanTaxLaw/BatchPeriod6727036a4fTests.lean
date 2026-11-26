import JapanTaxLaw.BatchPeriod6727036a4fSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod6727036a4f

example : limit = 45 := by decide
example : specMeets 45 = meets 45 := agree_spec_impl 45
example : specMeets 46 = meets 46 := agree_spec_impl 46
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod6727036a4f
