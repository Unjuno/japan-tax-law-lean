import JapanTaxLaw.BatchDeduct931e7442dbSpec

namespace JapanTaxLaw.BatchDeduct931e7442db

example : deduction = 270000 := by rfl
example : afterDeduction false 0 = 0 := by rfl
example : afterDeduction false (270000 + 5) = 270000 + 5 := by rfl
example : afterDeduction true 0 = 0 := by decide
example : afterDeduction true (270000 - 1) = 0 := by decide
example : afterDeduction true (270000) = 0 := by decide
example : afterDeduction true (270000 + 7) = 7 := by decide
example : specDeduction true (270000 + 7) = afterDeduction true (270000 + 7) := agree_spec_impl true (270000 + 7)

end JapanTaxLaw.BatchDeduct931e7442db
