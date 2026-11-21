import JapanTaxLaw.MortgageRegistrationCapital

/-!
# MortgageRegistrationCapital tests — 登録免許税法施行令 art.26 smoke checks
Decidable smoke tests, pinned to law 342CO0000000146 / revision 342CO0000000146_20261001_507CO0000000124.
境界: 499999999→true / 500000000→true / 500000001→false。
-/

namespace JapanTaxLaw.MortgageRegistrationCapital

example : capitalThresholdYen = 500_000_000 := by decide
example : isAtOrBelowThreshold 0 = true := by decide
example : isAtOrBelowThreshold 499_999_999 = true := by decide
example : isAtOrBelowThreshold 500_000_000 = true := by decide
example : isAtOrBelowThreshold 500_000_001 = false := by decide
example : isAtOrBelowThreshold 1_000_000_000 = false := by decide

end JapanTaxLaw.MortgageRegistrationCapital
