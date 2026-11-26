import JapanTaxLaw.PeninsulaSpecialDepreciationCostFloor5M
import JapanTaxLaw.PeninsulaSpecialDepreciationCostFloor5MSpec

/-
# PeninsulaSpecialDepreciationCostFloor5MTests — 半島振興省令 1(1)(1)ロ の kernel-decided 検証

Pinned: law 407M50000008016 / revision 407M50000008016_20250401_507M60000008028.
Closed Bool/Nat expressions discharged by `by decide`.
Coverage: zero, small inputs, the inclusive 5,000,000-yen boundary
(L-1/L/L+1) and impl/spec agreement.
-/

namespace JapanTaxLaw.PeninsulaSpecialDepreciationCostFloor5M

example : floorYen = 5_000_000 := by decide

-- 零入力・小さい入力
example : eligible 0 = false := by decide
example : eligible 1 = false := by decide
example : eligible 2 = false := by decide
example : eligible 3 = false := by decide

-- 境界: 五百万円 (L-1 / L / L+1)、以上は inclusive
example : eligible 4_999_999 = false := by decide
example : eligible 5_000_000 = true := by decide
example : eligible 5_000_001 = true := by decide

-- より大きな入力
example : eligible 10_000_000 = true := by decide

-- impl / 独立仕様の一致
example : floorYen = specFloor := by decide
example : eligible 0 = specEligible 0 := by decide
example : eligible 1 = specEligible 1 := by decide
example : eligible 4_999_999 = specEligible 4_999_999 := by decide
example : eligible 5_000_000 = specEligible 5_000_000 := by decide
example : eligible 5_000_001 = specEligible 5_000_001 := by decide
example : eligible 10_000_000 = specEligible 10_000_000 := by decide

end JapanTaxLaw.PeninsulaSpecialDepreciationCostFloor5M
