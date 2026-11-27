import JapanTaxLaw.BenefitTariffLowerRate
import JapanTaxLaw.BenefitTariffLowerRateSpec

/-! # BenefitTariffLowerRate tests — kernel-decided examples and boundary categories -/

namespace JapanTaxLaw.BenefitTariffLowerRate

-- Boundary category 1: no lower-rate law (表の税率そのもの)
example : effectiveRate 5 none = 5 := by decide
example : specEffective 5 none = 5 := by decide

-- Boundary category 2: lower-rate law strictly lower (低い税率を適用)
example : effectiveRate 100 (some 3) = 3 := by decide
example : specEffective 100 (some 3) = 3 := by decide

-- Boundary category 3: equal / higher (表の税率を維持)
example : effectiveRate 100 (some 100) = 100 := by decide
example : effectiveRate 100 (some 101) = 100 := by decide
example : specEffective 100 (some 100) = 100 := by decide
example : specEffective 100 (some 101) = 100 := by decide

-- Boundary category 4: zero
example : effectiveRate 0 (some 1) = 0 := by decide
example : specEffective 0 (some 1) = 0 := by decide

-- Universal agreement (no axioms, no finite-domain assumption):
#check spec_agrees

end JapanTaxLaw.BenefitTariffLowerRate
