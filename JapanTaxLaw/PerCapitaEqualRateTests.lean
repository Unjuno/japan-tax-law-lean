import JapanTaxLaw.PerCapitaEqualRate
import JapanTaxLaw.PerCapitaEqualRateSpec

/-!
# PerCapitaEqualRateTests — kernel-decided regression checks

地方税法 art. 38 (¥1,000 standard equal-rate amount). Boundaries 0/1/11/12/13
are checked; every assertion is decided by the Lean kernel. No new axioms and
no forbidden proof markers are introduced.
-/

namespace JapanTaxLaw.PerCapitaEqualRate

example : standardRate = 1_000 := by decide
example : standardRate = specRateYen := by decide
example : standardCharge 0 = 0 := by decide
example : standardCharge 1 = 1_000 := by decide
example : standardCharge 11 = 11_000 := by decide
example : standardCharge 12 = 12_000 := by decide
example : standardCharge 13 = 13_000 := by decide
example : standardCharge 100 = 100_000 := by decide
example : agreePerCapitaEqualRate = true := by decide
example : standardCharge 11 ≤ standardCharge 12 := by decide
example : standardCharge 12 ≤ standardCharge 13 := by decide

end JapanTaxLaw.PerCapitaEqualRate
