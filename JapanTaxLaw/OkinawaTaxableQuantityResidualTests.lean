import JapanTaxLaw.OkinawaTaxableQuantityResidual

/-!
# OkinawaTaxableQuantityResidual tests — kernel-decided boundary examples
Pinned to law 347M50000040042, revision 347M50000040042_20251231_507M60000040072, art. 20(1)(1の3).
Unit: statutory quantity units; saturating residual.
-/

namespace JapanTaxLaw.OkinawaTaxableQuantityResidual

example : taxableQuantity 0 0 = 0 := by decide
example : taxableQuantity 1 0 = 1 := by decide
example : taxableQuantity 100 0 = 100 := by decide
example : taxableQuantity 100 40 = 60 := by decide
example : taxableQuantity 100 100 = 0 := by decide
example : taxableQuantity 100 140 = 0 := by decide

end JapanTaxLaw.OkinawaTaxableQuantityResidual
