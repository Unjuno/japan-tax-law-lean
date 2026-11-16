import JapanTaxLaw.TaxFinance

/-!
# CorporateGroupLossOffset — 法人税法 art. 64の5(2)（通算対象欠損金額）・art. 64の5(4)
  （通算対象所得金額）L4 モデル

Sources (pinned):

  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 3B743C0FB772A2482ED143CBE2611E3B82E929868767514A3E1DB16F5C2EF342
  (data/raw/340AC0000000034_20261001_508AC0000000012.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as CorporateTaxRate.lean / CorporateSurtax.lean / CorporateLossCarryforward.lean)

Models art. 64の5(2)（通算対象欠損金額）と art. 64の5(4)（通算対象所得金額）— pinned bytes 逐語:

  「２前項に規定する通算対象欠損金額とは、第一号に掲げる金額に第二号に掲げる金額が
    第三号に掲げる金額のうちに占める割合を乗じて計算した金額をいう。
    一前項に規定する他の通算法人の基準日に終了する事業年度において生ずる通算前欠損金額の合計額
    （当該合計額が第三号に掲げる金額を超える場合には、その超える部分の金額を控除した金額）
    二前項の通算法人の所得事業年度の通算前所得金額
    三前項の通算法人の所得事業年度及び同項に規定する他の通算法人の基準日に終了する事業年度の
      通算前所得金額の合計額」

  「４前項に規定する通算対象所得金額とは、第一号に掲げる金額に第二号に掲げる金額が
    第三号に掲げる金額のうちに占める割合を乗じて計算した金額をいう。
    一前項に規定する他の通算法人の基準日に終了する事業年度の通算前所得金額の合計額
    （当該合計額が第三号に掲げる金額を超える場合には、その超える部分の金額を控除した金額）
    二前項の通算法人の欠損事業年度において生ずる通算前欠損金額
    三前項の通算法人の欠損事業年度及び同項に規定する他の通算法人の基準日に終了する事業年度において生ずる
      通算前欠損金額の合計額」

Computation:

  pool (§2-1) = min(sum of partners' pre-deduction losses, this-company's + partners' pre-deduction income total)
  rate       = ownPreTransferIncome / totalGroupIncome        (exact Nat division, floor)
  offset     = pool × ownIncome / totalGroupIncome
  Allocated back as.\ may exceed...

  (§4 — symmetric:)
  pool       = min(sum of partners' pre-deduction income, total group pre-deduction loss)
  rate       = ownLoss / totalGroupLoss
  offset     = pool × ownLoss / totalGroupLoss

Scope & honest boundaries:

* "通算前所得金額"/"通算前欠損金額" は art. 57(1)（欠損金の繰越し）を適用しない計算として
  caller-established Money（Art. 57(1) は法律上の別射程の法的定義 — 呼出元責任）
* "通算完全支配関係"（art. 2 十二号の七）の有無・基準日の一致・通算親法人/通算子法人の区別 —
  externally established booleans/facts（caller の責任）で構わない
* art. 64の5(5)〜(9)（当初申告金額基準・修正申告/更正取扱い・否認規定）— 非モデル化
* art. 64_5_II 第五号・第六号（提出除外要件等）— 非モデル化
* 通算される各社の share 配分の決定性・順序 — 非モデル化
* 割合の計算は切り捨て（Nat division）。政令による按分細目の適用可否 — caller-established choice。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 64の5(2) が適用されるかの caller-established precondition（通算完全支配関係等）を含まない、
    計算部分のみをモデル化。 -/
structure GroupLossFacts where
  /-- 自社の通算前所得金額（§2 第二号 — 欠損金の繰越し等を適用しない計算での所得の金額）。 -/
  ownPreTransferIncome : Money
  /-- 他の通算法人の基準日に終了する事業年度の通算前欠損金額の合計額（§2 第一号）。 -/
  partnerPreTransferLosses : Money
  /-- 自社の所得事業年度及び他の通算法人の基準日に終了する事業年度の通算前所得金額の合計額（§2 第三号）。 -/
  totalGroupPreTransferIncome : Money
  /-- 自社の通算前欠損金額（§4 第二号）。 -/
  ownPreTransferLoss : Money
  /-- 他の通算法人の基準日に終了する事業年度の通算前所得金額の合計額（§4 第一号）。 -/
  partnerPreTransferIncomes : Money
  /-- 自社の欠損事業年度及び他の通算法人の基準日に終了する事業年度の通算前欠損金額の合計額（§4 第三号）。 -/
  totalGroupPreTransferLoss : Money
  deriving DecidableEq, Repr

/-- §2 第一号: 超える部分を控除した後の合計額（min partnerLosses totalGroupIncome）。 -/
def pooledIntercompanyLoss (f : GroupLossFacts) : Money :=
  min f.partnerPreTransferLosses f.totalGroupPreTransferIncome

/-- §2: 通算対象欠損金額（損金算入できる金額）。 -/
def intercompanyLossDeduction (f : GroupLossFacts) : Money :=
  if f.totalGroupPreTransferIncome = 0 then 0
  else pooledIntercompanyLoss f * f.ownPreTransferIncome / f.totalGroupPreTransferIncome

/-- §4 第一号: 超える部分を控除した後の合計額。 -/
def pooledIntercompanyIncome (f : GroupLossFacts) : Money :=
  min f.partnerPreTransferIncomes f.totalGroupPreTransferLoss

/-- §4: 通算対象所得金額（益金算入できる金額）。 -/
def intercompanyIncomeInclusion (f : GroupLossFacts) : Money :=
  if f.totalGroupPreTransferLoss = 0 then 0
  else pooledIntercompanyIncome f * f.ownPreTransferLoss / f.totalGroupPreTransferLoss

-- ==== verified facts ====

theorem pooledIntercompanyLoss_le_partner (f : GroupLossFacts) :
    pooledIntercompanyLoss f ≤ f.partnerPreTransferLosses := Nat.min_le_left _ _

theorem pooledIntercompanyIncome_le_partnerIncomes (f : GroupLossFacts) :
    pooledIntercompanyIncome f ≤ f.partnerPreTransferIncomes := Nat.min_le_left _ _

theorem intercompanyLossDeduction_zero_group (f : GroupLossFacts)
    (h : f.totalGroupPreTransferIncome = 0) :
    intercompanyLossDeduction f = 0 := by
  unfold intercompanyLossDeduction
  rw [ite_eq_left h]

theorem intercompanyIncomeInclusion_zero_group (f : GroupLossFacts)
    (h : f.totalGroupPreTransferLoss = 0) :
    intercompanyIncomeInclusion f = 0 := by
  unfold intercompanyIncomeInclusion
  rw [ite_eq_left h]

/-- 完全に matching した loss引当額より、intercompanyLossDeduction は partnerLosses を超えない。 -/
theorem intercompanyLossDeduction_le_pooled (f : GroupLossFacts)
    (h : f.ownPreTransferIncome ≤ f.totalGroupPreTransferIncome) :
    intercompanyLossDeduction f ≤ pooledIntercompanyLoss f := by
  unfold intercompanyLossDeduction
  by_cases hz : f.totalGroupPreTransferIncome = 0
  · rw [ite_eq_left hz]
    exact Nat.zero_le _
  · rw [ite_eq_right hz]
    have h1 : pooledIntercompanyLoss f ≤ f.totalGroupPreTransferIncome := Nat.min_le_right _ _
    have h2 : pooledIntercompanyLoss f * f.ownPreTransferIncome
            ≤ pooledIntercompanyLoss f * f.totalGroupPreTransferIncome :=
      Nat.mul_le_mul_left _ h
    have h3 : pooledIntercompanyLoss f * f.totalGroupPreTransferIncome
            / f.totalGroupPreTransferIncome = pooledIntercompanyLoss f :=
      Nat.mul_div_cancel _ (Nat.pos_of_ne_zero hz)
    calc pooledIntercompanyLoss f * f.ownPreTransferIncome / f.totalGroupPreTransferIncome
        ≤ pooledIntercompanyLoss f * f.totalGroupPreTransferIncome / f.totalGroupPreTransferIncome :=
          Nat.div_le_div_right h2
      _ = pooledIntercompanyLoss f := h3

/-- symmetric: intercompanyIncomeInclusion は pooledIncome を超えない。 -/
theorem intercompanyIncomeInclusion_le_pooled (f : GroupLossFacts)
    (h : f.ownPreTransferLoss ≤ f.totalGroupPreTransferLoss) :
    intercompanyIncomeInclusion f ≤ pooledIntercompanyIncome f := by
  unfold intercompanyIncomeInclusion
  by_cases hz : f.totalGroupPreTransferLoss = 0
  · rw [ite_eq_left hz]
    exact Nat.zero_le _
  · rw [ite_eq_right hz]
    have h1 : pooledIntercompanyIncome f ≤ f.totalGroupPreTransferLoss := Nat.min_le_right _ _
    have h2 : pooledIntercompanyIncome f * f.ownPreTransferLoss
            ≤ pooledIntercompanyIncome f * f.totalGroupPreTransferLoss :=
      Nat.mul_le_mul_left _ h
    have h3 : pooledIntercompanyIncome f * f.totalGroupPreTransferLoss
            / f.totalGroupPreTransferLoss = pooledIntercompanyIncome f :=
      Nat.mul_div_cancel _ (Nat.pos_of_ne_zero hz)
    calc pooledIntercompanyIncome f * f.ownPreTransferLoss / f.totalGroupPreTransferLoss
        ≤ pooledIntercompanyIncome f * f.totalGroupPreTransferLoss / f.totalGroupPreTransferLoss :=
          Nat.div_le_div_right h2
      _ = pooledIntercompanyIncome f := h3

-- ==== kernel-decided smoke checks ====

-- one partner loss = 100, own income = 80, group income = 80 (partner has no income)
-- → pool 100? no: group income total = 80 → pool = 80 (超過控除), offset = 80*80/80 = 80
example : intercompanyLossDeduction ⟨80, 100, 80, 0, 0, 0⟩ = 80 := by decide
example : intercompanyLossDeduction ⟨80, 50, 80, 0, 0, 0⟩ = 50 := by decide
-- exactly even split: own 100 of 200 income, partner loss 50
example : intercompanyLossDeduction ⟨100, 50, 200, 0, 0, 0⟩ = 25 := by decide
-- multiple partners covering: own income 100, partner losses 60+30, group income 300
example : intercompanyLossDeduction ⟨100, 90, 300, 0, 0, 0⟩ = 30 := by decide
-- group income zero → 0 (но partner loss 無視)
example : intercompanyLossDeduction ⟨0, 500, 0, 0, 0, 0⟩ = 0 := by decide
-- own income exceeds group total? data inconsistency — caller must ensure consistency; model behaves
example : intercompanyLossDeduction ⟨400, 100, 300, 0, 0, 0⟩ = 133 := by decide
  -- 400×100/300 = 133
-- symmetric: own loss 80 of 160 group total loss, partner income 200
example : intercompanyIncomeInclusion ⟨0, 0, 0, 80, 200, 160⟩ = 80 := by decide
  -- pool = min(200, 160) = 160; 160*80/160 = 80
example : intercompanyIncomeInclusion ⟨0, 0, 0, 50, 200, 100⟩ = 50 := by decide
  -- pool = min(200, 100) = 100; 100*50/100 = 50
example : intercompanyIncomeInclusion ⟨0, 0, 0, 0, 100, 0⟩ = 0 := by decide
-- pool<partnerIncomes because of totalLoss cap
example : intercompanyIncomeInclusion ⟨0, 0, 0, 80, 200, 100⟩ = 80 := by decide
-- partner income alone exceeds group loss cap → pool capped at group loss
example : intercompanyIncomeInclusion ⟨0, 0, 0, 100, 500, 100⟩ = 100 := by decide

end JapanTaxLaw
