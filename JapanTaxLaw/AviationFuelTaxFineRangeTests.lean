import JapanTaxLaw.AviationFuelTaxFineRange

/-!
# AviationFuelTaxFineRange tests — kernel-decided boundary examples
Pinned to law 431AC0000000003, revision 431AC0000000003_20260401_508AC0000000002, art. 23(3).
Unit: 円; interval (2,000,000, unpaid].
-/

namespace JapanTaxLaw.AviationFuelTaxFineRange

example : withinFineRange 0 0 = false := by decide
example : withinFineRange 1 0 = false := by decide
example : withinFineRange 1999999 1999999 = false := by decide
example : withinFineRange 2000000 2000001 = false := by decide
example : withinFineRange 2000001 2000000 = false := by decide
example : withinFineRange 2000001 2000001 = true := by decide
example : withinFineRange 3000000 2500000 = true := by decide
example : withinFineRange 3000000 3000001 = false := by decide

end JapanTaxLaw.AviationFuelTaxFineRange
