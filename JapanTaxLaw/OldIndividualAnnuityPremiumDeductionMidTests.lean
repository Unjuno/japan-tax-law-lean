import JapanTaxLaw.OldIndividualAnnuityPremiumDeductionMid

/-!
# OldIndividualAnnuityPremiumDeductionMid tests — 旧個人年金保険料控除中段 smoke checks
Decidable smoke tests, pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
15000 + (total-15000)/2、上限 40000 で 27500。
-/

namespace JapanTaxLaw.OldIndividualAnnuityPremiumDeductionMid

example : deduction 16000 = 15500 := by decide
example : deduction 25000 = 20000 := by decide
example : deduction 40000 = 27500 := by decide

end JapanTaxLaw.OldIndividualAnnuityPremiumDeductionMid
