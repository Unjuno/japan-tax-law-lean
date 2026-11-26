import JapanTaxLaw.BankHeadOfficeTermReadingSpec

/-
# BankHeadOfficeTermReadingTests — kernel-decided boundary checks for the 読替え
-/

namespace JapanTaxLaw.BankHeadOfficeTermReading

example : readAs 0 = 1 := by decide
example : readAs 1 = 1 := by decide
example : readAs 2 = 2 := by decide
example : readAs 3 = 3 := by decide
example : specReadAs 0 = 1 := by decide
example : specReadAs 1 = 1 := by decide
example : readAs 0 = specReadAs 0 := by decide
example : readAs 1 = specReadAs 1 := by decide
example (x : Nat) : readAs x = specReadAs x := agree_read_as x
example : readAs 9 = specReadAs 9 := agree_read_as 9

end JapanTaxLaw.BankHeadOfficeTermReading
