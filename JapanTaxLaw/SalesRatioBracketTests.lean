import JapanTaxLaw.SalesRatioBracket

/-!
# SalesRatioBracket tests — 売上割合区分 smoke checks
Decidable smoke tests, pinned to law 423CO0000000112 / revision 423CO0000000112_20260401_508CO0000000102.
100%以上→80, 70〜99%→40, 70%未満→0。
-/

namespace JapanTaxLaw.SalesRatioBracket

example : bracket 100 = 80 := by decide
example : bracket 99 = 40 := by decide
example : bracket 70 = 40 := by decide
example : bracket 69 = 0 := by decide

end JapanTaxLaw.SalesRatioBracket
