import JapanTaxLaw.SpecialBaselineIncomeTax

/-!
# SpecialBaselineIncomeTaxTests — 租税特別措置法 art.41の19 の smoke checks

Decidable kernel-decided smoke tests, pinned to

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01

確認項目:

  * 率「百分の二十二・五」= 225/1000（**2250/1000 ではない**）の転記:
    `applySpecialRate 1000 = 225`。
  * 境界: 3億3千万円ちょうど → 超える部分 0、ちょうど超 → saturating/端数。
  * 控除額が課税額以上 → 0（saturating 減算）。
  * 端数（切り捨て）。
  * 該当性 Bool による選択。

NOT MODELLED: 基準所得金額の算定（第2項の各所得の合計・特別控除・政令規定）、
基準所得税額の各号別算定（第3項）、第4項・第5項（すべて caller-established、
impl の doc-comment 参照）。

-/


namespace JapanTaxLaw.SpecialBaselineIncomeTax

open JapanTaxLaw.TaxFinance

-- ==== 閾値・率の転記 ====

example : thresholdAmount = 330_000_000 := by decide
example : specialRate.num = 225 := rfl
example : specialRate.den = 1000 := rfl
-- smoke: base=1000 → 225（10 倍誤りなら 2250 になる）
example : applySpecialRate 1000 = 225 := by decide
example : applySpecialRate 100 = 22 := by decide
example : applySpecialRate 0 = 0 := by decide
-- 端数（切り捨て）
example : applySpecialRate 1 = 0 := by decide
example : applySpecialRate 5 = 1 := by decide

-- ==== 境界: 3億3千万円ちょうど / 超 ====

example : excessAmount 330_000_000 = 0 := by decide
example : specialBaselineIncomeTax 330_000_000 0 = 0 := by decide
example : specialBaselineIncomeTax 330_000_000 100 = 0 := by decide
-- ちょうど 1 円超（超える部分 = 1、端数切り捨てで 0）
example : excessAmount 330_000_001 = 1 := by decide
example : specialBaselineIncomeTax 330_000_001 0 = 0 := by decide
-- 超える部分 1000 → 225
example : specialBaselineIncomeTax 330_001_000 0 = 225 := by decide
example : specialBaselineIncomeTax 330_002_000 0 = 450 := by decide

-- ==== 控除 > 税額で 0（saturating） ====

example : specialBaselineIncomeTax 330_001_000 224 = 1 := by decide
example : specialBaselineIncomeTax 330_001_000 225 = 0 := by decide
example : specialBaselineIncomeTax 330_001_000 300 = 0 := by decide

-- ==== 端数（超える部分 5 → 1 円） ====

example : specialBaselineIncomeTax 330_000_005 0 = 1 := by decide

-- ==== 該当性 Bool による選択（caller-established） ====

example : specialBaselineIncomeTaxSelected false 999_999_999 0 = 0 := by decide
example : specialBaselineIncomeTaxSelected true 330_001_000 0 = 225 := by decide
example : specialBaselineIncomeTaxSelected true 330_001_000 300 = 0 := by decide

end JapanTaxLaw.SpecialBaselineIncomeTax
