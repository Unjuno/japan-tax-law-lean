import JapanTaxLaw.BatchDeductc0d94e6ac3Spec

namespace JapanTaxLaw.BatchDeductc0d94e6ac3

example : deduction = 350000 := by rfl
example : afterDeduction false 0 = 0 := by rfl
example : afterDeduction false (350000 + 5) = 350000 + 5 := by rfl
example : afterDeduction true 0 = 0 := by decide
example : afterDeduction true (350000 - 1) = 0 := by decide
example : afterDeduction true (350000) = 0 := by decide
example : afterDeduction true (350000 + 7) = 7 := by decide
example : specDeduction true (350000 + 7) = afterDeduction true (350000 + 7) := agree_spec_impl true (350000 + 7)

end JapanTaxLaw.BatchDeductc0d94e6ac3
