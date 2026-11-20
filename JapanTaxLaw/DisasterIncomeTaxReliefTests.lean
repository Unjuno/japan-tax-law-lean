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

example : specFullRelief 5_000_000 := by unfold specFullRelief; decide
example : specFullRelief 0 := by unfold specFullRelief; decide
example : ¬ specFullRelief 5_000_001 := by unfold specFullRelief; decide

example : agreeFullRelief 0 := agree_full_relief 0
example : agreeFullRelief 5_000_001 := agree_full_relief 5_000_001
example : agreeFullRelief 7_500_001 := agree_full_relief 7_500_001

end JapanTaxLaw.DisasterIncomeTaxReliefTests
