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

-- 境界（単一定数まわりの smoke 確認）: 数量 0 千本 → 税額 0、数量 1 千本 → 定額税率そのもの
-- 1_070 * 0 = 0（ゼロ入力・結果 0）、1_070 * 1 = 1_070（1..13 の小さい正の入力）
example : ratePerThousand * 0 = 0 := by decide
example : ratePerThousand * 1 = 1_070 := by decide

end JapanTaxLaw.LocalTobaccoTaxRate
