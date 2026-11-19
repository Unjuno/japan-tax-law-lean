import JapanTaxLaw.StandardRateExcessRatio

/-!
# StandardRateExcessRatio tests — 地方税法施行令 art. 35の4の6 境界 smoke checks

Decidable smoke tests, pinned to
  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083

境界: 分母 0 / baseTax = standardTaxEquivalent で 0 / 端数（切り捨て）/
各号の合計・控除（saturating）。
-/

namespace JapanTaxLaw.StandardRateExcessRatio

open JapanTaxLaw.TaxFinance

-- 標準税率超過率: 分母 0
example : standardRateExcessRatio 0 0 = 0 := by decide
example : standardRateExcessRatio 0 12345 = 0 := by decide

-- 標準税率超過率: baseTax = standardTaxEquivalent → 0
example : standardRateExcessRatio 100 100 = 0 := by decide
example : standardRateExcessRatio 1 1 = 0 := by decide

-- 標準税率超過率: 端数（Nat 除算は切り捨て）
example : standardRateExcessRatio 100 1 = 0 := by decide
example : standardRateExcessRatio 3 1 = 0 := by decide

-- 標準税率超過率: 標準税率相当額 > 基準事業税額 → saturating 0 / 控除 0 → 1
example : standardRateExcessRatio 100 200 = 0 := by decide
example : standardRateExcessRatio 100 0 = 1 := by decide

-- 基準事業税額: 一号〜三号・五号の合計 − 四号（saturating）
example : baseBusinessTax [1, 2, 3, 5] [4] = 7 := by decide
example : baseBusinessTax [10, 20, 30] [5] = 55 := by decide
example : baseBusinessTax [10] [50] = 0 := by decide
example : baseBusinessTax [] [] = 0 := by decide
example : baseBusinessTax [10, 20, 30] [] = 60 := by decide

-- 第1項を第2項から組み立てたもの
example : excessRatioFromItems [1, 2, 3, 5] [4] 7 = 0 := by decide
example : excessRatioFromItems [1, 2, 3, 5] [4] 0 = 1 := by decide

end JapanTaxLaw.StandardRateExcessRatio
