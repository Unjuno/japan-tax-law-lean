import JapanTaxLaw.OilGasGrantTax

/-!
# OilGasGrantTax tests — 石油ガス譲与税法 art.1 smoke checks
Decidable smoke tests, pinned to law 340AC0000000157 / revision 340AC0000000157_20090401_421AC0000000009.
境界: 奇数収入は切捨て（1→0, 3→1, 101→50）。
-/

namespace JapanTaxLaw.OilGasGrantTax

example : grantYen 0 = 0 := by decide
example : grantYen 1 = 0 := by decide
example : grantYen 2 = 1 := by decide
example : grantYen 3 = 1 := by decide
example : grantYen 100 = 50 := by decide
example : grantYen 101 = 50 := by decide
example : grantYen 1_000_000 = 500_000 := by decide

end JapanTaxLaw.OilGasGrantTax
