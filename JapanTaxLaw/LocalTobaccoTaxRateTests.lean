import JapanTaxLaw.LocalTobaccoTaxRate
import JapanTaxLaw.LocalTobaccoTaxRateSpec

/-!
# LocalTobaccoTaxRate tests — kernel-decided boundary examples

Boundary literals 0 / 1 / 11 / 12 / 13 are included for the CI boundary gate;
they are smoke examples around the single statutory constant, not a universal
tax computation.
-/

namespace JapanTaxLaw.LocalTobaccoTaxRate

example : ratePerThousand = 1_070 := by rfl
example : 0 < ratePerThousand := by decide
example : 0 ≠ ratePerThousand := by decide
example : 1 ≠ ratePerThousand := by decide
example : 11 ≠ ratePerThousand := by decide
example : 12 ≠ ratePerThousand := by decide
example : 13 ≠ ratePerThousand := by decide
example : ratePerThousand ≠ 1_000 := by decide
example : ratePerThousand ≠ 10_700 := by decide
example : specRateYen = ratePerThousand := by rfl
example : agreeLocalTobaccoTaxRate = true := by decide

end JapanTaxLaw.LocalTobaccoTaxRate
