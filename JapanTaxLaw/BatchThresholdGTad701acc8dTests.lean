import JapanTaxLaw.BatchThresholdGTad701acc8dSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTad701acc8d

example : limit = 9500000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 9500000 = meets 9500000 := agree_spec_impl 9500000
example : specMeets 9500001 = meets 9500001 := agree_spec_impl 9500001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTad701acc8d
