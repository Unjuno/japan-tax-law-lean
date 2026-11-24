import JapanTaxLaw.BatchThresholdLE53bab5e52fSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE53bab5e52f

example : limit = 1500000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 1500000 = meets 1500000 := agree_spec_impl 1500000
example : specMeets 1500001 = meets 1500001 := agree_spec_impl 1500001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE53bab5e52f
