import JapanTaxLaw.BatchThresholdLE6a1073f41aSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE6a1073f41a

example : limit = 850000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 850000 = meets 850000 := agree_spec_impl 850000
example : specMeets 850001 = meets 850001 := agree_spec_impl 850001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE6a1073f41a
