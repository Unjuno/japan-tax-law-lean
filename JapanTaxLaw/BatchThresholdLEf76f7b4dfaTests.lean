import JapanTaxLaw.BatchThresholdLEf76f7b4dfaSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLEf76f7b4dfa

example : limit = 7000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 7000000 = meets 7000000 := agree_spec_impl 7000000
example : specMeets 7000001 = meets 7000001 := agree_spec_impl 7000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLEf76f7b4dfa
