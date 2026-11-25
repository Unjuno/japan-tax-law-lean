import JapanTaxLaw.PowerDevelopmentTaxFineRange

/-!
# PowerDevelopmentTaxFineRange tests — kernel-decided boundary examples
Pinned to law 349AC0000000079, revision 349AC0000000079_20250601_504AC0000000068, art. 12(4).
Unit: 円; interval (500,000, taxAmount].
-/

namespace JapanTaxLaw.PowerDevelopmentTaxFineRange

example : withinFineRange 0 0 = false := by decide
example : withinFineRange 1 0 = false := by decide
example : withinFineRange 499999 499999 = false := by decide
example : withinFineRange 500000 500001 = false := by decide
example : withinFineRange 500001 500000 = false := by decide
example : withinFineRange 500001 500001 = true := by decide
example : withinFineRange 700000 600000 = true := by decide
example : withinFineRange 700000 700001 = false := by decide

end JapanTaxLaw.PowerDevelopmentTaxFineRange
