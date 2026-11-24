import JapanTaxLaw.BatchThresholdLEc532201044Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLEc532201044

example : limit = 15000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 15000 = meets 15000 := agree_spec_impl 15000
example : specMeets 15001 = meets 15001 := agree_spec_impl 15001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLEc532201044
