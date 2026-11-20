import JapanTaxLaw.PowderSakeQuantity

/-!
# PowderSakeQuantity tests — 酒税法施行令 art.12の3 smoke checks
Decidable smoke tests, pinned to law 337CO0000000097 / revision 337CO0000000097_20250401_507CO0000000006.
境界: 重量 0/1/10/100kg に対する リットル×100 = kg×73。
-/

namespace JapanTaxLaw.PowderSakeQuantity

example : litersTimes100 0 = 0 := by decide
example : litersTimes100 1 = 73 := by decide
example : litersTimes100 2 = 146 := by decide
example : litersTimes100 10 = 730 := by decide
example : litersTimes100 100 = 7300 := by decide
example : litersTimes100 1000 = 73000 := by decide

end JapanTaxLaw.PowderSakeQuantity
