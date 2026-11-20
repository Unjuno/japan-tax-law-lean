import JapanTaxLaw.SavingsGroupFineSpec

/-! Kernel-decided boundary examples for 納税貯蓄組合法 art. 14. -/

namespace JapanTaxLaw.SavingsGroupFineTests

open JapanTaxLaw.SavingsGroupFine
open JapanTaxLaw.SavingsGroupFineSpec

example : administrativeFineCap = 100_000 := rfl
example : fineAmount 0 = 0 := by decide
example : fineAmount 1 = 1 := by decide
example : fineAmount 11 = 11 := by decide
example : fineAmount 100_000 = 100_000 := by decide
example : fineAmount 100_001 = 100_000 := by decide
example : withinFineCap 0 = true := by decide
example : withinFineCap 100_000 = true := by decide
example : withinFineCap 100_001 = false := by decide
example : specFineCap = 100_000 := rfl
example : agreeFineCap := agree_fine_cap
example : agreeFineAmount 100_001 := agree_fine_amount 100_001

end JapanTaxLaw.SavingsGroupFineTests
