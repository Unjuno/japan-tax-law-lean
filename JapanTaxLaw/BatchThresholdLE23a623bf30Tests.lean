import JapanTaxLaw.BatchThresholdLE23a623bf30Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE23a623bf30

example : limit = 1320000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 1320000 = meets 1320000 := agree_spec_impl 1320000
example : specMeets 1320001 = meets 1320001 := agree_spec_impl 1320001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE23a623bf30
