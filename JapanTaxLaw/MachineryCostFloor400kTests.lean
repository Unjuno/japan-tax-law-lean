import JapanTaxLaw.MachineryCostFloor400k
import JapanTaxLaw.MachineryCostFloor400kSpec

/-!
# MachineryCostFloor400kTests — kernel-decided regression checks

租税特別措置法施行令 art. 27の12の4 (取得価額 40万円以上). Boundaries
399,999 / 400,000 / 400,001 are checked. Every assertion is kernel-decided.
-/

namespace JapanTaxLaw.MachineryCostFloor400k

example : acquisitionCostFloor = 400_000 := by decide
example : acquisitionCostFloor = specFloor := by decide
example : qualifies 0 = false := by decide
example : qualifies 399_999 = false := by decide
example : qualifies 400_000 = true := by decide
example : qualifies 400_001 = true := by decide
example : specQualifies 399_999 = false := by decide
example : specQualifies 400_000 = true := by decide
example : agreeMachineryCostFloor = true := by decide

end JapanTaxLaw.MachineryCostFloor400k
