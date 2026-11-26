import JapanTaxLaw.BatchDeductdb5c3d41f5Spec

namespace JapanTaxLaw.BatchDeductdb5c3d41f5

example : deduction = 600000 := by rfl
example : afterDeduction false 0 = 0 := by rfl
example : afterDeduction false (600000 + 5) = 600000 + 5 := by rfl
example : afterDeduction true 0 = 0 := by decide
example : afterDeduction true (600000 - 1) = 0 := by decide
example : afterDeduction true (600000) = 0 := by decide
example : afterDeduction true (600000 + 7) = 7 := by decide
example : specDeduction true (600000 + 7) = afterDeduction true (600000 + 7) := agree_spec_impl true (600000 + 7)

end JapanTaxLaw.BatchDeductdb5c3d41f5
