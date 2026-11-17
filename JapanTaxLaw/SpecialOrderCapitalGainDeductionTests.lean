import JapanTaxLaw.SpecialOrderCapitalGainDeduction

/-!
# SpecialOrderCapitalGainDeduction tests — 租税特別措置法施行令 第二十四条 smoke checks

Decidable smoke tests for the ¥50,000,000 cap slice, pinned to

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Amendment enforcement date: 2026-11-01

Every `example` is kernel-decided. Boundaries: 0, 49_999_999, 50_000_000,
50_000_001, plus the sequential priority-order list cases.
-/

namespace JapanTaxLaw.SpecialOrderCapitalGainDeduction

open JapanTaxLaw.TaxFinance

-- 限度額リテラル
example : capitalGainSpecialDeductionCap = 50_000_000 := by decide
example : 0 < capitalGainSpecialDeductionCap := by decide

-- 「五千万円の範囲内」の境界
example : withinCap 0 = 0 := by decide
example : withinCap 49_999_999 = 49_999_999 := by decide
example : withinCap 50_000_000 = 50_000_000 := by decide
example : withinCap 50_000_001 = 50_000_000 := by decide
example : withinCap 99_999_999 = 50_000_000 := by decide

-- 優先順位リスト（7 条文）
example : deductionPriorityOrder = [0, 1, 2, 3, 4, 5, 6] := by decide
example : deductionPriorityOrder.length = 7 := by decide
example : deductionPriorityOrder.Nodup := by decide

-- 「満たない部分の金額」
example : shortfall 0 = 50_000_000 := by decide
example : shortfall 49_999_999 = 1 := by decide
example : shortfall 50_000_000 = 0 := by decide
example : shortfall 50_000_001 = 0 := by decide

-- 合計控除額の境界
example : specialDeductionTotal [] = 0 := by decide
example : specialDeductionTotal [0, 0, 0, 0, 0, 0, 0] = 0 := by decide
example : specialDeductionTotal [49_999_999] = 49_999_999 := by decide
example : specialDeductionTotal [50_000_000] = 50_000_000 := by decide
example : specialDeductionTotal [50_000_001] = 50_000_000 := by decide

-- 順次適用（優先順位どおりのリスト）: 合計が上限をまたぐケース
example : specialDeductionTotal [30_000_000, 19_999_999] = 49_999_999 := by decide
example : specialDeductionTotal [30_000_000, 20_000_000] = 50_000_000 := by decide
example : specialDeductionTotal [30_000_000, 20_000_001] = 50_000_000 := by decide
example : specialDeductionTotal [50_000_000, 1, 2, 3] = 50_000_000 := by decide
example : specialDeductionTotal [50_000_001, 1, 2, 3] = 50_000_000 := by decide
example : specialDeductionTotal [10_000_000, 10_000_000, 10_000_000, 10_000_000, 10_000_000,
    10_000_000, 10_000_000] = 50_000_000 := by decide

end JapanTaxLaw.SpecialOrderCapitalGainDeduction
