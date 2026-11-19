import JapanTaxLaw.NonTaxSavingsCeiling

/-!
# NonTaxSavingsCeiling tests — 所得税法施行令 art.40 kernel-decide smoke checks

Pinned to

  Law id: 340CO0000000096
  Revision: 340CO0000000096_20260522_508CO0000000093

数式（原文逐語から導出）:

  記載する最高限度額 = 10,000 × units
  上限 = 3,000,000（第四号が無い場合）／ 3,000,000 − 第四号の合計額
        （saturating、合計額 ≥ 3,000,000 で 0）
  制約 = 記載額 ≤ 上限

境界: 合計額 ≥ 300 万で 0、整数 0、上限ちょうど（300 unit）、1 unit 超過、
端数（残額が一万円の整数倍でない場合の切り捨て）。
-/

namespace JapanTaxLaw.NonTaxSavingsCeiling

-- 一万円に整数を乗じた金額（declaredCeiling）
example : declaredCeiling 0 = 0 := by decide
example : declaredCeiling 1 = 10_000 := by decide
example : declaredCeiling 2 = 20_000 := by decide
example : declaredCeiling 300 = 3_000_000 := by decide
example : declaredCeiling 301 = 3_010_000 := by decide

-- 第四号の合計額 0（該当なし）→ 上限 3,000,000
example : residualCeiling 0 = 3_000_000 := by decide

-- 合計額を控除した残額
example : residualCeiling 1_000_000 = 2_000_000 := by decide
example : residualCeiling 2_999_999 = 1 := by decide

-- 境界: 合計額 = 300 万 → 0（saturating、残額ゼロ）
example : residualCeiling 3_000_000 = 0 := by decide
-- 境界: 合計額 > 300 万 → 0
example : residualCeiling 3_000_001 = 0 := by decide
example : residualCeiling 10_000_000 = 0 := by decide

-- 端数: 残額が一万円の整数倍でない（2,999,999）
example : residualCeiling 1 = 2_999_999 := by decide
example : residualCeiling 55_555 = 2_944_445 := by decide

-- 上限ちょうどは許容 / 1 unit 超過は不可
example : ceilingWithinLimit 300 0 := by decide
example : ¬ ceilingWithinLimit 301 0 := by decide

-- 整数 0 は上限 0 でも許容
example : ceilingWithinLimit 0 3_000_000 := by decide
example : ceilingWithinLimit 0 10_000_000 := by decide

-- 端数を含む上限の境界: 299 unit はOK、300 unit は不可
example : ceilingWithinLimit 299 1 := by decide
example : ¬ ceilingWithinLimit 300 1 := by decide

-- 第四号合計額が大きいと unit 数が減る
example : ceilingWithinLimit 200 1_000_000 := by decide
example : ¬ ceilingWithinLimit 201 1_000_000 := by decide

-- 最大 unit 数（端数切り捨て）
example : maxAllowedUnits 0 = 300 := by decide
example : maxAllowedUnits 1 = 299 := by decide
example : maxAllowedUnits 55_555 = 294 := by decide
example : maxAllowedUnits 3_000_000 = 0 := by decide
example : maxAllowedUnits 3_000_001 = 0 := by decide

end JapanTaxLaw.NonTaxSavingsCeiling
