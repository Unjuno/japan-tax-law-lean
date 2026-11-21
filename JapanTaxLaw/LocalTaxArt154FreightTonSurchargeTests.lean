import JapanTaxLaw.LocalTaxArt154FreightTonSurchargeSpec

/-!
# LocalTaxArt154FreightTonSurchargeTests — kernel-checked checks for 地方税法 第百五十四条(1)

Freight-vehicle 標準税率: base 四万五百 (40,500) + 六千三百 (6,300) per started
ton over 八トン (8 tons = 8,000 kg). Boundary cases at 8,000 / 8,001 / 9,000 /
9,001 kg verify the 「一トンまでごとに」 ceiling (round-up) behavior.
-/

namespace JapanTaxLaw.LocalTaxArt154FreightTonSurcharge

open JapanTaxLaw.TaxFinance

-- Constants derived programmatically from the verbatim needle.
example : baseFeeYen = 40_500 := rfl
example : incrementYen = 6_300 := rfl
example : thresholdKg = 8_000 := rfl

-- chargeableTons: ceiling of excess kg / 1000, zero at/below 8 tons.
example : chargeableTons 8_000 = 0 := by decide
example : chargeableTons 8_001 = 1 := by decide
example : chargeableTons 9_000 = 1 := by decide
example : chargeableTons 9_001 = 2 := by decide

-- amountYen boundary values: base only at threshold, one/two increments above.
example : amountYen 8_000 = 40_500 := by decide
example : amountYen 8_001 = 46_800 := by decide
example : amountYen 9_000 = 46_800 := by decide
example : amountYen 9_001 = 53_100 := by decide

-- Universal implementation/spec agreement.
example (loadKg : Nat) : chargeableTons loadKg = specChargeableTons loadKg :=
  agree_chargeable_tons loadKg

end JapanTaxLaw.LocalTaxArt154FreightTonSurcharge
