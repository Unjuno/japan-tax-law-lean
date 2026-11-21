import JapanTaxLaw.SpecialCorporationGrantTax

/-!
# SpecialCorporationGrantTax tests — 地方税法 art.29 smoke checks
Decidable smoke tests, pinned to law 431AC0000000004 / revision 431AC0000000004_20260401_508AC0000000002.
恒等: grantYen(revenue)=revenue。
-/

namespace JapanTaxLaw.SpecialCorporationGrantTax

example : grantYen 0 = 0 := by decide
example : grantYen 1 = 1 := by decide
example : grantYen 2 = 2 := by decide
example : grantYen 999 = 999 := by decide
example : grantYen 1_000_000 = 1_000_000 := by decide
example : grantYen 10_000_000 = 10_000_000 := by decide

end JapanTaxLaw.SpecialCorporationGrantTax
