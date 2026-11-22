import JapanTaxLaw.HousingLoanCredit

/-!
# HousingLoanCredit tests — 住宅借入金控除 smoke checks
Decidable smoke tests, pinned to law 407AC0000000011 / revision 407AC0000000011_20200401_502AC0000000008.
-/

namespace JapanTaxLaw.HousingLoanCredit

example : creditYen 0 = 0 := by decide
example : creditYen 5_000_000 = 100_000 := by decide
example : creditYen 10_000_000 = 200_000 := by decide
example : creditYen 15_000_000 = 250_000 := by decide
example : creditYen 20_000_000 = 300_000 := by decide
example : creditYen 30_000_000 = 350_000 := by decide

end JapanTaxLaw.HousingLoanCredit
