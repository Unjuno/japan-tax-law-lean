import JapanTaxLaw.IncomeDependentDeductions

/-!
# IncomeDependentDeductions tests — kernel-decided smoke checks

Decidable smoke tests for the 所得税法 art. 84 bounded model, pinned to

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01

No new theorem names are introduced; every check is an `example ... := by decide`.
art. 186の2 is NOT MODELLED (procedural legal-fiction rule, no arithmetic), so no
test targets it.
-/

namespace JapanTaxLaw.IncomeDependentDeductions

open JapanTaxLaw.TaxFinance

-- ==== art. 84: 一人当たり定数（原文の日本語数字を検証） ====

example : generalDependentAmount = 380_000 := by decide  -- 三十八万円
example : specificDependentAmount = 630_000 := by decide  -- 六十三万円
example : elderlyDependentAmount = 480_000 := by decide  -- 四十八万円
example : specificDependentAmount > elderlyDependentAmount := by decide
example : elderlyDependentAmount > generalDependentAmount := by decide

-- ==== art. 84: 区分選択 ====

example : art84AmountPerDependent .general = 380_000 := by decide
example : art84AmountPerDependent .specific = 630_000 := by decide
example : art84AmountPerDependent .elderly = 480_000 := by decide

-- ==== art. 84: 合計額 = 金額 × 人数（上限なし） ====

example : art84TotalDependentDeduction ⟨0, 0, 0⟩ = 0 := by decide
example : art84TotalDependentDeduction ⟨1, 0, 0⟩ = 380_000 := by decide
example : art84TotalDependentDeduction ⟨0, 1, 0⟩ = 630_000 := by decide
example : art84TotalDependentDeduction ⟨0, 0, 1⟩ = 480_000 := by decide
example : art84TotalDependentDeduction ⟨2, 1, 3⟩ = 2_830_000 := by decide
example : art84TotalDependentDeduction ⟨3, 2, 1⟩ = 2_880_000 := by decide
example : art84TotalDependentDeduction ⟨100, 0, 0⟩ = 38_000_000 := by decide

-- ==== art. 84: 控除後（saturating） ====

example : art84IncomeAfterDependentDeduction 1_000_000 ⟨2, 0, 0⟩ = 240_000 := by decide
example : art84IncomeAfterDependentDeduction 380_000 ⟨1, 0, 0⟩ = 0 := by decide
example : art84IncomeAfterDependentDeduction 379_999 ⟨1, 0, 0⟩ = 0 := by decide
example : art84IncomeAfterDependentDeduction 0 ⟨0, 0, 0⟩ = 0 := by decide

end JapanTaxLaw.IncomeDependentDeductions
