import JapanTaxLaw.PublicPensionWithholding

/-!
# PublicPensionWithholding tests — art. 203の3 kernel-decide smoke checks

Decidable smoke tests for the withholding rate skeleton, pinned to

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01

Covered boundaries: netAmount = 0, threshold ちょうど, threshold 超, months = 0,
plus the 5% / 10% bracket and the 第三号・第六号・第七号 selection.
政令の月割額・各号の該当性判定は NOT MODELLED.
-/

namespace JapanTaxLaw.PublicPensionWithholding

open JapanTaxLaw.TaxFinance

-- 基本税率 百分の五 / 超過税率 百分の十
example : pensionWithholdingBasicRate = ⟨5, 100, by decide⟩ := rfl
example : pensionWithholdingExcessRate = ⟨10, 100, by decide⟩ := rfl
example : pensionWithholdingBasicRate.applyFloor 1_000 = 50 := by decide
example : pensionWithholdingExcessRate.applyFloor 1_000 = 100 := by decide

-- 十六万二千五百円 × 月数
example : excessThreshold 0 = 0 := by decide
example : excessThreshold 1 = 162_500 := by decide
example : excessThreshold 12 = 1_950_000 := by decide

-- 第一号・第二号・第四号・第五号: 残額全体に百分の五
example : pensionWithholdingTax 0 = 0 := by decide
example : pensionWithholdingTax 162_500 = 8_125 := by decide
example : pensionWithholdingTax 1_000_000 = 50_000 := by decide

-- 第三号・第六号: 境界 — threshold ちょうどは 5% のみ
example : pensionWithholdingWithExcess 162_500 1 = 8_125 := by decide
-- threshold 超の 1 円は 10% だが切り捨てで 0
example : pensionWithholdingWithExcess 162_501 1 = 8_125 := by decide
-- 明確な超過分: 8,125 + 1,000,000*10% = 108,125
example : pensionWithholdingWithExcess 1_162_500 1 = 108_125 := by decide
-- 月数 12: threshold = 1,950,000
example : pensionWithholdingWithExcess 2_950_000 12 = 197_500 := by decide

-- 月数 0 の境界: threshold = 0 なので基礎分 0、全額が超過分（10%）
example : pensionWithholdingWithExcess 0 0 = 0 := by decide
example : pensionWithholdingWithExcess 100_000 0 = 10_000 := by decide

-- 第七号: 残額全体に百分の十
example : pensionWithholdingSeventh 0 = 0 := by decide
example : pensionWithholdingSeventh 162_500 = 16_250 := by decide
example : pensionWithholdingSeventh 1_000_000 = 100_000 := by decide

-- 区分選択: Bool は選択にのみ使用（第七号が第三号・第六号より優先）
example : pensionWithholdingByCategory ⟨1_000_000, 1, false, false⟩ = 50_000 := by decide
example : pensionWithholdingByCategory ⟨1_162_500, 1, true, false⟩ = 108_125 := by decide
example : pensionWithholdingByCategory ⟨1_000_000, 1, false, true⟩ = 100_000 := by decide
example : pensionWithholdingByCategory ⟨1_162_500, 1, true, true⟩ = 116_250 := by decide

end JapanTaxLaw.PublicPensionWithholding
