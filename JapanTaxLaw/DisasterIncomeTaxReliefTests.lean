import JapanTaxLaw.DisasterIncomeTaxReliefSpec

/-!
# DisasterIncomeTaxReliefTests — kernel-decided boundary examples (art. 2)
-/

namespace JapanTaxLaw.DisasterIncomeTaxReliefTests

open JapanTaxLaw.DisasterIncomeTaxRelief
open JapanTaxLaw.DisasterIncomeTaxReliefSpec

example : reliefFraction 0 = (10, 10) := by decide
example : reliefFraction 5_000_000 = (10, 10) := by decide
example : reliefFraction 5_000_001 = (5, 10) := by decide
example : reliefFraction 7_500_000 = (5, 10) := by decide
example : reliefFraction 7_500_001 = (5, 20) := by decide
example : reliefFraction 10_000_000 = (5, 20) := by decide
example : reliefFraction 11 = (10, 10) := by decide
example : reliefFraction 1_200_000 = (10, 10) := by decide
example : reliefFraction 13_000_000 = (5, 20) := by decide

example : specReliefFraction 5_000_000 = (10, 10) := by decide
example : specReliefFraction 5_000_001 = (5, 10) := by decide
example : specReliefFraction 7_500_001 = (5, 20) := by decide

example : agreeReliefFraction 0 := agree_relief_fraction 0
example : agreeReliefFraction 5_000_001 := agree_relief_fraction 5_000_001
example : agreeReliefFraction 7_500_001 := agree_relief_fraction 7_500_001

end JapanTaxLaw.DisasterIncomeTaxReliefTests
