import JapanTaxLaw.GasolineTaxCombination

/-!
# GasolineTaxCombination tests — 揮発油税合算 smoke checks
Decidable smoke tests, pinned to law 330CO0000000100 / revision 330CO0000000100_20250401_506CO0000000372.
加法: 0, 100+50=150, 1000+2000=3000。
-/

namespace JapanTaxLaw.GasolineTaxCombination

example : combinedAmount 0 0 = 0 := by decide
example : combinedAmount 1 2 = 3 := by decide
example : combinedAmount 100 50 = 150 := by decide
example : combinedAmount 1000 2000 = 3000 := by decide
example : combinedAmount 1_000_000 2_000_000 = 3_000_000 := by decide

end JapanTaxLaw.GasolineTaxCombination
