import JapanTaxLaw.TouristTaxFineRange

/-!
# TouristTaxFineRange tests — kernel-decided boundary examples
Pinned to law 430AC0000000016, revision 430AC0000000016_20260701_508AC0000000012, art. 24(2).
Unit: 円; interval (2,000,000, unpaid].
-/

namespace JapanTaxLaw.TouristTaxFineRange

example : withinFineRange 0 0 = false := by decide
example : withinFineRange 1 0 = false := by decide
example : withinFineRange 1999999 1999999 = false := by decide
example : withinFineRange 2000000 2000001 = false := by decide
example : withinFineRange 2000001 2000000 = false := by decide
example : withinFineRange 2000001 2000001 = true := by decide
example : withinFineRange 3000000 2500000 = true := by decide
example : withinFineRange 3000000 3000001 = false := by decide

end JapanTaxLaw.TouristTaxFineRange
