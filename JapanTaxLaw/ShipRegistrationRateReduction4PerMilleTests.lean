import JapanTaxLaw.ShipRegistrationRateReduction4PerMilleSpec

/-!
# ShipRegistrationRateReduction4PerMille tests — kernel-decided boundary checks

Pinned to law 342AC0000000035 / revision 342AC0000000035_20261101_508AC0000000021.
境界: 3 / 4 / 5（千分の四控除、下限 0）。
-/

namespace JapanTaxLaw.ShipRegistrationRateReduction4PerMille

example : reducedRatePerMille 0 = 0 := by decide
example : reducedRatePerMille 1 = 0 := by decide
example : reducedRatePerMille 3 = 0 := by decide
example : reducedRatePerMille 4 = 0 := by decide
example : reducedRatePerMille 5 = 1 := by decide
example : reducedRatePerMille 6 = 2 := by decide
example : specReduced 3 = 0 := by decide
example : specReduced 5 = 1 := by decide

end JapanTaxLaw.ShipRegistrationRateReduction4PerMille
