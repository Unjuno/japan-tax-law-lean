import JapanTaxLaw.BatchThresholdGTf9721e2d2aSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTf9721e2d2a

example : limit = 1350000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 1350000 = meets 1350000 := agree_spec_impl 1350000
example : specMeets 1350001 = meets 1350001 := agree_spec_impl 1350001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTf9721e2d2a
