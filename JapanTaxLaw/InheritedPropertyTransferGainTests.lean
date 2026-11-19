import JapanTaxLaw.InheritedPropertyTransferGain

/-!
# InheritedPropertyTransferGainTests — 租税特別措置法施行令 art. 25の16 の smoke checks

Decidable kernel-decided smoke tests, pinned to

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Amendment enforcement date: 2026-11-01

境界（計算額 < 残額 / 計算額 > 残額 / 計算額 = 残額 / 収入金額 < 合計額 /
収入金額 = 合計額 / 端数切り捨て）を確認する。

NOT MODELLED: 相続税額・二号の割合の具体的算定（他条文参照）・収入金額・取得費・
譲渡費用・該当性（すべて caller-established、impl の doc-comment 参照）。
-/

namespace JapanTaxLaw.InheritedPropertyTransferGain

open JapanTaxLaw.TaxFinance

-- ==== 合計額 ====
example : transferCostTotal 300_000 50_000 = 350_000 := by decide
example : transferCostTotal 0 0 = 0 := by decide

-- ==== 計算額（一号 × 二号、切り捨て） ====
example : inheritedTransferBase 1_000_000 ⟨1, 10, by decide⟩ = 100_000 := by decide
example : inheritedTransferBase 1_000 ⟨1, 3, by decide⟩ = 333 := by decide
example : inheritedTransferBase 100 ⟨0, 1, by decide⟩ = 0 := by decide
example : inheritedTransferBase 0 ⟨1, 2, by decide⟩ = 0 := by decide

-- ==== 残額（ただし書の上限） ====
example : inheritedResidualGain 500_000 300_000 = 200_000 := by decide
example : inheritedResidualGain 300_000 500_000 = 0 := by decide
example : inheritedResidualGain 300_000 300_000 = 0 := by decide
example : inheritedResidualGain 0 0 = 0 := by decide

-- ==== 特例金額: 計算額 < 残額 → 計算額 ====
example : inheritedTransferGain 1_000_000 ⟨1, 10, by decide⟩ 500_000 300_000 = 100_000 := by decide
example : inheritedTransferGain 1_000 ⟨1, 3, by decide⟩ 2_000 1_000 = 333 := by decide

-- ==== 特例金額: 計算額 > 残額 → 残額（ただし書の上限が効く） ====
example : inheritedTransferGain 5_000_000 ⟨1, 10, by decide⟩ 400_000 100_000 = 300_000 := by decide
example : inheritedTransferGain 1_000 ⟨1, 3, by decide⟩ 1_000 800 = 200 := by decide

-- ==== 特例金額: 計算額 = 残額 → 計算額（境界は連続） ====
example : inheritedTransferGain 1_000_000 ⟨1, 10, by decide⟩ 400_000 300_000 = 100_000 := by decide

-- ==== 特例金額: 収入金額 < 合計額 → 0（「ないもの」） ====
example : inheritedTransferGain 1_000_000 ⟨1, 2, by decide⟩ 100_000 300_000 = 0 := by decide

-- ==== 特例金額: 収入金額 = 合計額 → 0 ====
example : inheritedTransferGain 1_000_000 ⟨1, 10, by decide⟩ 300_000 300_000 = 0 := by decide

-- ==== 特例金額: 計算額そのものが 0 なら 0 ====
example : inheritedTransferGain 100 ⟨0, 1, by decide⟩ 900_000 5 = 0 := by decide

-- ==== 合計額を経由した計算 ====
-- 合計額 350_000 → 残額 150_000、計算額 200_000 → 残額が上限
example : inheritedTransferGain 2_000_000 ⟨1, 10, by decide⟩ 500_000
    (transferCostTotal 300_000 50_000) = 150_000 := by decide

end JapanTaxLaw.InheritedPropertyTransferGain
