import JapanTaxLaw.TaxFinance

/-!
# SpecialOrderCapitalGainDeduction — 租税特別措置法施行令 第二十四条（譲渡所得の特別控除額の特例・5000万円上限） bounded L4 スライス

Source (pinned):

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/332CO0000000043_20261101_507CO0000000127.law.json
  (revision CurrentEnforced per data/INVENTORY.json)

Pinned 原文（一字も変更せず、needle として転記監査に渡す）:

  「（譲渡所得の特別控除額の特例）第二十四条法第三十六条に規定する政令で定めるところにより計算した金額は、
    五千万円の範囲内において、まず法第三十三条の四第一項の規定により控除すべき金額から成るものとし、
    同項の規定の適用がない場合又は同項の規定により控除すべき金額が五千万円に満たない場合には、
    五千万円又は当該満たない部分の金額の範囲内において、順次法第三十五条第一項、第三十四条第一項、
    第三十四条の二第一項、第三十五条の二第一項、第三十四条の三第一項及び第三十五条の三第一項の
    規定により控除すべき金額から成るものとして計算した金額とする。」

Models the *computable core* of 第二十四条: the aggregate special deduction is
capped at 五千万円 (¥50,000,000). The statute composes the deduction from a
priority-ordered sequence of provisions; each individual deduction amount and
its applicability is caller-established, so this model only takes the amounts
(Nat, hence no Bool) and caps their sum.

Computation (Money = Nat):

  capitalGainSpecialDeductionCap = 50_000_000
  withinCap amount = min amount capitalGainSpecialDeductionCap
  shortfall used = capitalGainSpecialDeductionCap - withinCap used
  specialDeductionTotal amounts = withinCap (amounts.sum)

Scope & honest boundaries:

* 各控除額は caller-established な `Money`（Nat）。該当しない控除は 0 を渡す。
  **Bool は計算式に入れない**（適用判定は行わない）。
* `deductionPriorityOrder` は原文の「まず…順次…」の優先順位を表す Nat のリスト
  （0=法33条の4第1項, 1=法35条第1項, 2=法34条第1項, 3=法34条の2第1項,
   4=法35条の2第1項, 5=法34条の3第1項, 6=法35条の3第1項）。
  `specialDeductionTotal` に渡すリストはこの順番で caller が並べるものとする。
* 法第三十六条の「政令で定めるところにより計算した金額」そのもの、
  各参照条文（法33条の4/35/34/34条の2/35条の2/34条の3/35条の3）の控除額算定・
  適用要件、および「適用がない場合」の判定は **NOT MODELLED**（caller-established）。
* 上限のみをモデル化し、優先順位に沿う各控除の「まず／順次」の適用ロジック自体は
  NOT MODELLED。下限や端数処理の規定は本条にない。
* Pinned evidence is in doc-comments only; every theorem below claims a property
  of the model, never of the real legal semantics (転記監査は fidelity-only)。
-/

namespace JapanTaxLaw.SpecialOrderCapitalGainDeduction

open JapanTaxLaw.TaxFinance

/-- 第二十四条の控除限度額 五千万円。 -/
def capitalGainSpecialDeductionCap : Money := 50_000_000

/-- 「五千万円の範囲内」の上限: `min amount 50_000_000`。 -/
def withinCap (amount : Money) : Money := min amount capitalGainSpecialDeductionCap

/-- 原文の「まず…順次…」の優先順位を表す Nat のリスト（呼出元はこの順で額を渡す）。
    0=法33条の4第1項, 1=法35条第1項, 2=法34条第1項, 3=法34条の2第1項,
    4=法35条の2第1項, 5=法34条の3第1項, 6=法35条の3第1項。 -/
def deductionPriorityOrder : List Nat := [0, 1, 2, 3, 4, 5, 6]

/-- 「五千万円に満たない場合」の「満たない部分の金額」（残り余裕）。
    `withinCap used ≤ cap` なので Nat の減算は saturating にならない。 -/
def shortfall (used : Money) : Money := capitalGainSpecialDeductionCap - withinCap used

/-- 合計特別控除額 = 優先順位どおりに渡された額の合計を五千万円以下にキャップ。
    各額は非負 (Nat) なので、順次キャップしても合計してからキャップしても同じ。 -/
def specialDeductionTotal (amounts : List Money) : Money := withinCap amounts.sum

-- ==== verified facts about the model (model consistency only) ====

/-- 限度額は正。 -/
theorem capitalGainSpecialDeductionCap_pos : 0 < capitalGainSpecialDeductionCap := by
  decide

example : capitalGainSpecialDeductionCap = 50_000_000 := by decide

/-- 上限適用額は非負。 -/
theorem withinCap_nonneg (a : Money) : 0 ≤ withinCap a := Nat.zero_le _

/-- 上限適用額は五千万円以下。 -/
theorem withinCap_le_cap (a : Money) : withinCap a ≤ capitalGainSpecialDeductionCap := by
  unfold withinCap
  exact Nat.min_le_right _ _

/-- 上限適用額は元の額以下。 -/
theorem withinCap_le_self (a : Money) : withinCap a ≤ a := by
  unfold withinCap
  exact Nat.min_le_left _ _

/-- 額が上限以下ならそのまま。 -/
theorem withinCap_eq_of_le_cap (a : Money) (h : a ≤ capitalGainSpecialDeductionCap) :
    withinCap a = a := by
  unfold withinCap
  exact Nat.min_eq_left h

/-- 額が上限以上なら上限。 -/
theorem withinCap_eq_cap_of_ge (a : Money) (h : capitalGainSpecialDeductionCap ≤ a) :
    withinCap a = capitalGainSpecialDeductionCap := by
  unfold withinCap
  exact Nat.min_eq_right h

/-- 優先順位リストは 7 条文分（法33条の4 + 順次 6 条文）。 -/
theorem deductionPriorityOrder_length : deductionPriorityOrder.length = 7 := by
  decide

example : deductionPriorityOrder.Nodup := by decide

/-- 満たない部分（残り余裕）は非負。 -/
theorem shortfall_nonneg (used : Money) : 0 ≤ shortfall used := Nat.zero_le _

/-- 満たない部分は上限以下。 -/
theorem shortfall_le_cap (used : Money) : shortfall used ≤ capitalGainSpecialDeductionCap := by
  unfold shortfall
  exact Nat.sub_le _ _

/-- 満たない部分 + 上限適用額 = 上限。 -/
theorem shortfall_add_withinCap (used : Money) :
    shortfall used + withinCap used = capitalGainSpecialDeductionCap := by
  unfold shortfall
  exact Nat.sub_add_cancel (withinCap_le_cap used)

/-- 合計控除額は非負。 -/
theorem specialDeductionTotal_nonneg (amounts : List Money) :
    0 ≤ specialDeductionTotal amounts := Nat.zero_le _

/-- 合計控除額は五千万円以下。 -/
theorem specialDeductionTotal_le_cap (amounts : List Money) :
    specialDeductionTotal amounts ≤ capitalGainSpecialDeductionCap := by
  unfold specialDeductionTotal
  exact withinCap_le_cap _

/-- 合計控除額は合計額以下。 -/
theorem specialDeductionTotal_le_sum (amounts : List Money) :
    specialDeductionTotal amounts ≤ amounts.sum := by
  unfold specialDeductionTotal withinCap
  exact Nat.min_le_left _ _

/-- 合計額が上限以下ならキャップされない。 -/
theorem specialDeductionTotal_eq_sum_of_le_cap (amounts : List Money)
    (h : amounts.sum ≤ capitalGainSpecialDeductionCap) :
    specialDeductionTotal amounts = amounts.sum := by
  unfold specialDeductionTotal
  exact withinCap_eq_of_le_cap _ h

/-- 先頭額が上限以上なら合計控除額は上限。 -/
theorem specialDeductionTotal_cap_of_first_ge (a : Money) (rest : List Money)
    (h : capitalGainSpecialDeductionCap ≤ a) :
    specialDeductionTotal (a :: rest) = capitalGainSpecialDeductionCap := by
  unfold specialDeductionTotal withinCap
  rw [List.sum_cons]
  exact Nat.min_eq_right (Nat.le_trans h (Nat.le_add_right _ _))

-- ==== kernel-decided smoke checks (boundaries: 0 / 49_999_999 / 50_000_000 / 50_000_001) ====

example : withinCap 0 = 0 := by decide
example : withinCap 1 = 1 := by decide
example : withinCap 49_999_999 = 49_999_999 := by decide
example : withinCap 50_000_000 = 50_000_000 := by decide
example : withinCap 50_000_001 = 50_000_000 := by decide
example : withinCap 100_000_000 = 50_000_000 := by decide

example : shortfall 0 = 50_000_000 := by decide
example : shortfall 49_999_999 = 1 := by decide
example : shortfall 50_000_000 = 0 := by decide
example : shortfall 50_000_001 = 0 := by decide

example : specialDeductionTotal [] = 0 := by decide
example : specialDeductionTotal [0] = 0 := by decide
example : specialDeductionTotal [49_999_999] = 49_999_999 := by decide
example : specialDeductionTotal [50_000_000] = 50_000_000 := by decide
example : specialDeductionTotal [50_000_001] = 50_000_000 := by decide
example : specialDeductionTotal [30_000_000, 19_999_999] = 49_999_999 := by decide
example : specialDeductionTotal [30_000_000, 20_000_000] = 50_000_000 := by decide
example : specialDeductionTotal [30_000_000, 20_000_001] = 50_000_000 := by decide
example : specialDeductionTotal [50_000_000, 1] = 50_000_000 := by decide

end JapanTaxLaw.SpecialOrderCapitalGainDeduction
