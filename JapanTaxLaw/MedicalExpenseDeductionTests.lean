import JapanTaxLaw.MedicalExpenseDeduction

/-!
# MedicalExpenseDeduction tests — 医療費控除 smoke checks
Decidable smoke tests, pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
閾値min(5%,10万)、控除min(超過額,200万)。
-/

namespace JapanTaxLaw.MedicalExpenseDeduction

example : threshold 1000000 = 50000 := by decide
example : threshold 5000000 = 100000 := by decide
example : deduction 1000000 200000 = 150000 := by decide
example : deduction 1000000 30000 = 0 := by decide
example : deduction 1000000 3000000 = 2000000 := by decide

end JapanTaxLaw.MedicalExpenseDeduction
