import JapanTaxLaw.BatchThresholdGT53c89e76daSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT53c89e76da

example : limit = 10000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 10000000 = meets 10000000 := agree_spec_impl 10000000
example : specMeets 10000001 = meets 10000001 := agree_spec_impl 10000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT53c89e76da
