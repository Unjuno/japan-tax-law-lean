import JapanTaxLaw.TaxableQuantityResidual

/-!
# TaxableQuantityResidual tests — kernel-decided boundary examples
Pinned to law 328AC0000000006, revision 328AC0000000006_20260525_506AC0000000052, art. 30_2(1)(3).
Unit: statutory quantity units; saturating residual.
-/

namespace JapanTaxLaw.TaxableQuantityResidual

example : taxableQuantity 0 0 = 0 := by decide
example : taxableQuantity 1 0 = 1 := by decide
example : taxableQuantity 100 0 = 100 := by decide
example : taxableQuantity 100 40 = 60 := by decide
example : taxableQuantity 100 100 = 0 := by decide
example : taxableQuantity 100 150 = 0 := by decide

end JapanTaxLaw.TaxableQuantityResidual
