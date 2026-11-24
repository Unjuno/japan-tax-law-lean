import JapanTaxLaw.BatchThresholdLEf7583e3888Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLEf7583e3888

example : limit = 20000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 20000 = meets 20000 := agree_spec_impl 20000
example : specMeets 20001 = meets 20001 := agree_spec_impl 20001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLEf7583e3888
