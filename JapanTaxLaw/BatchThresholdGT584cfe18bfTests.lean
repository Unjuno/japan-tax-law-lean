import JapanTaxLaw.BatchThresholdGT584cfe18bfSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT584cfe18bf

example : limit = 1000000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 1000000000 = meets 1000000000 := agree_spec_impl 1000000000
example : specMeets 1000000001 = meets 1000000001 := agree_spec_impl 1000000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT584cfe18bf
