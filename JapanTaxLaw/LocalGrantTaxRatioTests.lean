import JapanTaxLaw.LocalGrantTaxRatio

/-!
# LocalGrantTaxRatio tests — 交付税配分 smoke checks
Decidable smoke tests, pinned to law 325AC0000000211 / revision 325AC0000000211_20261102_508AC0000000062.
94% + 6% = 100%。
-/

namespace JapanTaxLaw.LocalGrantTaxRatio

example : ordinary 100000 = 94000 := by decide
example : special 100000 = 6000 := by decide
example : ordinary 100000 + special 100000 = 100000 := by decide

end JapanTaxLaw.LocalGrantTaxRatio
