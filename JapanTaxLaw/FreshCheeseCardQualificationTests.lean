import JapanTaxLaw.FreshCheeseCardQualification

/-!
# FreshCheeseCardQualification tests — kernel-decided boundary examples
Pinned to law 335CO0000000069, revision 335CO0000000069_20260401_508CO0000000085, art. 32(2)(5).
Bounds: dry solid <=48%, piece <=4g, net weight >5kg.
-/

namespace JapanTaxLaw.FreshCheeseCardQualification

example : qualified 0 0 0 = false := by decide
example : qualified 1 1 6 = true := by decide
example : qualified 47 3 5 = false := by decide
example : qualified 48 4 6 = true := by decide
example : qualified 49 4 6 = false := by decide
example : qualified 48 5 6 = false := by decide
example : qualified 48 4 5 = false := by decide

end JapanTaxLaw.FreshCheeseCardQualification
