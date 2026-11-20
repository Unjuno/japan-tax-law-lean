import JapanTaxLaw.RateBandArt19
import JapanTaxLaw.RateBandArt19Spec

/-!
# RateBandArt19Tests — kernel-decided boundary examples
-/
namespace JapanTaxLaw.RateBandArt19Tests

open JapanTaxLaw.RateBandArt19
open JapanTaxLaw.RateBandArt19Spec

/-- 実装と独立仕様の対応。 -/
theorem agrees_with_implementation (amount : Nat) :
    inBand amount = true ↔ band amount := by
  by_cases ha : 10_000_000 <= amount <;> by_cases hb : amount < 15_000_000 <;>
    simp [inBand, band, lowerYen, upperYenExclusive, ha, hb]

-- 境界: 下限を含む / 上限を含まない
example : inBand 9_999_999 = false := by decide
example : inBand 10_000_000 = true := by decide
example : inBand 12_000_000 = true := by decide
example : inBand 14_999_999 = true := by decide
example : inBand 15_000_000 = false := by decide

-- 独立仕様側の境界
example : band 10_000_000 := by unfold band; decide
example : ¬ band 15_000_000 := by unfold band; decide
example : ¬ band 9_999_999 := by unfold band; decide

end JapanTaxLaw.RateBandArt19Tests
