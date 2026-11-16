import JapanTaxLaw.CorporateLossCarryforward

/-!
# CorporateLossCarryforward tests — 法人税法 art. 57 smoke checks

Decidable smoke tests for the loss-carryforward cap computation, pinned to
  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01

Each example covers a boundary case of art. 57(1) or art. 57(11).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 57(1) ただし書: 50% 上限を超える欠損金は損金算入できない（SME でない場合）
example : lossCarryforwardDeduction ⟨false, false, false, 10_000_000, 6_000_000, 0⟩ = 5_000_000 := by decide
example : lossCarryforwardDeduction ⟨false, false, false, 1_000_000, 1_000_000, 0⟩ = 500_000 := by decide
-- art. 57(11) の読み替え（SME）が効く場合: 欠損金の全額損金算入可能
example : lossCarryforwardDeduction ⟨true, false, false, 10_000_000, 6_000_000, 0⟩ = 6_000_000 := by decide
example : lossCarryforwardDeduction ⟨true, false, false, 10_000_000, 20_000_000, 0⟩ = 10_000_000 := by decide
-- 再生事業年度でも同じ
example : lossCarryforwardDeduction ⟨false, true, false, 10_000_000, 6_000_000, 0⟩ = 6_000_000 := by decide
-- 設立日から 7 年以内でも同じ
example : lossCarryforwardDeduction ⟨false, false, true, 10_000_000, 6_000_000, 0⟩ = 6_000_000 := by decide

-- 既に過年度の欠損を使用している場合（欠損発生前年度までの使用分）
example : lossCarryforwardDeduction ⟨false, false, false, 10_000_000, 6_000_000, 3_000_000⟩ = 2_000_000 := by decide
example : lossCarryforwardDeduction ⟨false, false, false, 10_000_000, 6_000_000, 5_000_000⟩ = 0 := by decide
example : lossCarryforwardDeduction ⟨false, false, false, 10_000_000, 6_000_000, 8_000_000⟩ = 0 := by decide
-- 欠損が 50% 上限よりも小さい場合は全額
example : lossCarryforwardDeduction ⟨false, false, false, 10_000_000, 3_000_000, 0⟩ = 3_000_000 := by decide
-- 所得ゼロ
example : lossCarryforwardDeduction ⟨false, false, false, 0, 1_000_000, 0⟩ = 0 := by decide
-- SME の場合、既使用ゼロで欠損が所得より大きい場合は所得額まで
example : lossCarryforwardDeduction ⟨true, false, false, 2_000_000, 9_000_000, 0⟩ = 2_000_000 := by decide

-- carveOutApplies: 構成要素 isSme || isReorg || isFounding
example : carveOutApplies ⟨true, false, false, 0, 0, 0⟩ = true := by decide
example : carveOutApplies ⟨false, true, false, 0, 0, 0⟩ = true := by decide
example : carveOutApplies ⟨false, false, true, 0, 0, 0⟩ = true := by decide
example : carveOutApplies ⟨false, false, false, 0, 0, 0⟩ = false := by decide

end JapanTaxLaw
