import JapanTaxLaw.CustomsAdditionalDutyCeiling

/-!
# CustomsAdditionalDutyCeiling tests — kernel-decided boundary examples
Pinned to law 143AC0000000054, revision 143AC0000000054_20260601_508AC0000000005, art. 9(1)(1).
Unit: 円; ceiling = saturating (課税価格 - 適正卸売価格) - 別表関税額.
-/

namespace JapanTaxLaw.CustomsAdditionalDutyCeiling

example : priceGap 0 100 = 0 := by decide
example : priceGap 1 100 = 0 := by decide
example : ceiling 50 100 0 = 0 := by decide
example : ceiling 100 50 10 = 40 := by decide
example : withinCeiling 0 100 50 10 = true := by decide
example : withinCeiling 1 100 50 10 = true := by decide
example : withinCeiling 40 100 50 10 = true := by decide
example : withinCeiling 41 100 50 10 = false := by decide

end JapanTaxLaw.CustomsAdditionalDutyCeiling
