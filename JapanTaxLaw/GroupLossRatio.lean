import JapanTaxLaw.TaxFinance

/-!
# GroupLossRatio — 法人税法 art. 64の7（欠損金の通算）の割合計算規則 L4 モデル

Source (pinned):

  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: (data/raw/340AC0000000034_20261001_508AC0000000012.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Models only the two explicit ratio rules embedded in art. 64の7 — pinned bytes 逐語:

  * 2項ハ「（１）に掲げる金額に（２）に掲げる金額が（２）及び（３）に掲げる金額の合計額
    （「所得合計額」という。）のうちに占める割合を乗じて計算した金額（「非特定欠損金配賦額」という。）
    がロに掲げる金額を超える場合…（所得合計額が零である場合には、零）」
  * 3項「（１）に掲げる金額が（２）及び（３）に掲げる金額の合計額のうちに占める割合
    （当該合計額が零である場合には零とし、当該割合が一を超える場合には一とする。）を
    乗じて計算した金額（以下この条において「特定損金算入限度額」という。）」

Two rules, modelled as a reusable common semantic (Phase C):

  safeRatio num den : if den = 0 then 0 else if num ≤ den then num/den else 1
    — 「合計額が零→零」「割合が一超→一」を Nat で表現（num/den は切り捨て）。
  nonSpecificAllocation pool incomePart totalIncome : pool × safeRatio incomePart totalIncome
    — art. 64の7(2)ハ の「金額×割合」構造。totalIncome=0 → 0。

Honest boundaries — art. 64の7全体は 9163 文字の複雑な配分規定であり、本モジュールはその
**明確な割合規則のみ**をモデル化する。以下は NOT YET COVERED:

  * 「十年内事業年度」「対応事業年度」「親法人十年内事業年度等」の期間特定（政令依存）。
  * 特定欠損金額の4つの除外（１）〜（４）、非特定欠損金の配分・加算・控除の全体式。
  * 特定損金算入限度額の「欠損控除前所得金額に達するまで」のキャップ（3項イ(2)）。
  * 通算完全支配関係・通算親法人/子法人・損金算入限度額 — caller-established。
  * 割合を Nat で表現するため、端数は切り捨て（条文の丸め規則は別途政令・通達に依存し得る）。
  * 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 64の7(2)ハ／(3) — 「合計額が零→零、割合が一超→一」の割合。
    Nat なので num/den は切り捨て、1 は den/den。 -/
def safeRatio (num den : Money) : Money :=
  if den = 0 then 0
  else if num ≤ den then num / den
  else 1

/-- art. 64の7(2)ハ — 非特定欠損金配額 = 金額 × 割合。 -/
def nonSpecificAllocation (pool incomePart totalIncome : Money) : Money :=
  pool * safeRatio incomePart totalIncome

-- ==== verified facts ====

theorem safeRatio_zero_den (num : Money) : safeRatio num 0 = 0 := by
  unfold safeRatio; rw [ite_eq_left rfl]

theorem safeRatio_le_one (num den : Money) : safeRatio num den ≤ 1 := by
  unfold safeRatio
  by_cases hd : den = 0
  · rw [ite_eq_left hd]
    decide
  · rw [ite_eq_right hd]
    by_cases hle : num ≤ den
    · rw [ite_eq_left hle]
      have hdenpos : 0 < den := Nat.pos_of_ne_zero hd
      have h1 : num ≤ 1 * den := by simpa using hle
      have h2 : 1 * den < 2 * den := Nat.mul_lt_mul_of_pos_right (by decide : 1 < 2) hdenpos
      have hlt : num < 2 * den := Nat.lt_of_le_of_lt h1 h2
      have hdivlt : num / den < 2 := (Nat.div_lt_iff_lt_mul hdenpos).2 hlt
      exact Nat.le_of_lt_succ hdivlt
    · rw [ite_eq_right hle]
      decide

/-- num ≤ den のとき safeRatio = num/den。 -/
theorem safeRatio_eq_div (num den : Money) (h : num ≤ den) (hd : den ≠ 0) :
    safeRatio num den = num / den := by
  unfold safeRatio
  rw [ite_eq_right hd]
  rw [ite_eq_left h]

/-- den=0 のとき配分額は 0。 -/
theorem nonSpecificAllocation_zero_den (pool incomePart : Money) :
    nonSpecificAllocation pool incomePart 0 = 0 := by
  unfold nonSpecificAllocation safeRatio
  rw [ite_eq_left rfl]
  simp

/-- incomePart=0 のとき配分額は 0（den≠0）。 -/
theorem nonSpecificAllocation_zero_income (pool den : Money) (hd : den ≠ 0) :
    nonSpecificAllocation pool 0 den = 0 := by
  unfold nonSpecificAllocation safeRatio
  rw [ite_eq_right hd]
  rw [ite_eq_left (Nat.zero_le den)]
  simp

-- ==== kernel-decided smoke checks ====

-- 割合: 分母0→0、通常は切り捨て、1超→1
example : safeRatio 3 0 = 0 := by decide
example : safeRatio 1 2 = 0 := by decide        -- 1/2 切り捨て
example : safeRatio 2 2 = 1 := by decide
example : safeRatio 5 2 = 1 := by decide        -- 1超を1にキャップ
-- 配分: pool × 割合
example : nonSpecificAllocation 100 2 2 = 100 := by decide
example : nonSpecificAllocation 100 1 2 = 0 := by decide
example : nonSpecificAllocation 100 3 0 = 0 := by decide
example : nonSpecificAllocation 0 5 2 = 0 := by decide

end JapanTaxLaw
