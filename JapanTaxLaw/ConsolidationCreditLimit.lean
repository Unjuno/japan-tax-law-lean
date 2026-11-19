import JapanTaxLaw.TaxFinance

/-!
# ConsolidationCreditLimit — 法人税法施行令 art.148（通算法人に係る控除限度額の計算）L4 モデル

Sources (pinned):

  Law id: 340CO0000000097（法人税法施行令 / CabinetOrder）
  Revision: 340CO0000000097_20261001_507CO0000000121
  Amendment enforcement date: 2026-10-01
  Raw snapshot: data/raw/340CO0000000097_20261001_507CO0000000121.law.json
  Article Num 148, flat/normalized leaf text 3094 chars, U+3000 count 0
  （担当範囲原文 C7_148.txt の本文 3094 文字と完全一致）。

Models art.148(1) と (2) の計算部分のみ — pinned bytes 逐語:

  §1 「…同項の通算法人の通算事業年度…の調整前控除限度額から当該通算事業年度の
       控除限度調整額を控除した金額（当該調整前控除限度額が零を下回る場合には、零）とする。」
  §2 「前項に規定する調整前控除限度額とは、第一号に掲げる金額に第二号に掲げる金額の
       うちに第三号に掲げる金額の占める割合を乗じて計算した金額…をいう。」

Computation:

  §2 調整前控除限度額 = firstAmount + (secondAmount × thirdAmount) / secondAmount
                     （第二号 ≠ 0 なら firstAmount + thirdAmount に等しい。
                       原文の「割合を乗じて」形を乗算先行で保持。分母 0 → 0 の安全版）
  §1 控除限度額      = if preAdjustment ≤ adjustment then 0 else preAdjustment - adjustment
                     （saturating 減算 = max(preAdjustment − adjustment, 0)）

Scope & honest boundaries:

  * 各金額（第一号〜第三号、調整前控除限度額、控除限度調整額）および通算法人・
    通算事業年度・通算完全支配関係の該当性はすべて caller-established Money/fact。
    Bool は金額式に入れない。
  * §2 第一号〜第三号の具体的算定（法 67–70、租税特別措置法 42の4/42の14/62/63/
    66の7/66の9の3 等多数参照、所得金額・欠損金額・調整国外所得金額の算定）は NOT MODELLED。
  * §3 以降（§3 所得金額/欠損金額の対象規定、§4 調整前国外所得金額、§5 加算調整額、
    §6 調整金額、§7 控除限度調整額の算定、§8 準用、§9 通知）は NOT MODELLED。
  * 割合は整数の乗除（Nat 除算、切り捨て）で近似するが、乗算先行のため本スライスでは
    端数は生じない。厳密な有理数割合・丸め規則の法的詳細は主張しない。
  * Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw.ConsolidationCreditLimit

open JapanTaxLaw.TaxFinance

/-- §2 調整前控除限度額。原文「第一号に掲げる金額に第二号に掲げる金額のうちに
    第三号に掲げる金額の占める割合を乗じて計算した金額」を整数乗除で模型化。
    分母（第二号）0 → 0（安全版）。第二号 ≠ 0 なら `firstAmount + thirdAmount`。 -/
def preAdjustmentLimit (firstAmount secondAmount thirdAmount : Money) : Money :=
  if secondAmount = 0 then 0
  else firstAmount + secondAmount * thirdAmount / secondAmount

/-- §1 控除限度額。原文「調整前控除限度額から…控除限度調整額を控除した金額
    （当該調整前控除限度額が零を下回る場合には、零）」= saturating 減算。 -/
def consolidationCreditLimit (preAdjustment adjustment : Money) : Money :=
  if preAdjustment ≤ adjustment then 0 else preAdjustment - adjustment

-- ==== verified facts (model properties only) ====

/-- 分母（第二号）0 → 0（安全版）。 -/
theorem preAdjustmentLimit_zero_denominator (firstAmount thirdAmount : Money) :
    preAdjustmentLimit firstAmount 0 thirdAmount = 0 := by
  unfold preAdjustmentLimit
  simp

/-- 第二号 ≠ 0 のとき、割合按分は `firstAmount + thirdAmount` に等しい
    （`second × third / second = third` による）。 -/
theorem preAdjustmentLimit_eq_add (firstAmount secondAmount thirdAmount : Money)
    (h : secondAmount ≠ 0) :
    preAdjustmentLimit firstAmount secondAmount thirdAmount = firstAmount + thirdAmount := by
  unfold preAdjustmentLimit
  rw [ite_eq_right h]
  have hmul : secondAmount * thirdAmount / secondAmount = thirdAmount := by
    rw [Nat.mul_comm secondAmount thirdAmount]
    exact Nat.mul_div_cancel thirdAmount (Nat.pos_of_ne_zero h)
  rw [hmul]

/-- 正数性: 第二号 ≠ 0 かつ第一号 > 0 なら調整前控除限度額は正。 -/
theorem preAdjustmentLimit_pos (firstAmount secondAmount thirdAmount : Money)
    (h : secondAmount ≠ 0) (hfirst : 0 < firstAmount) :
    0 < preAdjustmentLimit firstAmount secondAmount thirdAmount := by
  rw [preAdjustmentLimit_eq_add firstAmount secondAmount thirdAmount h]
  exact Nat.lt_of_lt_of_le hfirst (Nat.le_add_right firstAmount thirdAmount)

/-- 第一号について単調非減少。 -/
theorem preAdjustmentLimit_mono_first {f₁ f₂ secondAmount thirdAmount : Money} (h : f₁ ≤ f₂) :
    preAdjustmentLimit f₁ secondAmount thirdAmount ≤ preAdjustmentLimit f₂ secondAmount thirdAmount := by
  unfold preAdjustmentLimit
  by_cases hs : secondAmount = 0
  · rw [ite_eq_left hs, ite_eq_left hs]
    exact Nat.zero_le _
  · rw [ite_eq_right hs, ite_eq_right hs]
    exact Nat.add_le_add_right h _

/-- §1: 調整額 < 調整前額 なら saturation 分岐に入らず差を返す。 -/
theorem consolidationCreditLimit_eq (preAdjustment adjustment : Money) (h : adjustment < preAdjustment) :
    consolidationCreditLimit preAdjustment adjustment = preAdjustment - adjustment := by
  unfold consolidationCreditLimit
  rw [ite_eq_right (Nat.not_le_of_gt h)]

/-- §1: 調整額 ≥ 調整前額 → 0（零を下回る場合には零）。 -/
theorem consolidationCreditLimit_zero_of_le (preAdjustment adjustment : Money)
    (h : preAdjustment ≤ adjustment) :
    consolidationCreditLimit preAdjustment adjustment = 0 := by
  unfold consolidationCreditLimit
  rw [ite_eq_left h]

/-- 控除限度額は常に調整前控除限度額以下。 -/
theorem consolidationCreditLimit_le_pre (preAdjustment adjustment : Money) :
    consolidationCreditLimit preAdjustment adjustment ≤ preAdjustment := by
  unfold consolidationCreditLimit
  by_cases h : preAdjustment ≤ adjustment
  · rw [ite_eq_left h]
    exact Nat.zero_le _
  · rw [ite_eq_right h]
    exact Nat.sub_le _ _

/-- 正数性: 調整額 < 調整前額 なら控除限度額は正。 -/
theorem consolidationCreditLimit_pos (preAdjustment adjustment : Money) (h : adjustment < preAdjustment) :
    0 < consolidationCreditLimit preAdjustment adjustment := by
  rw [consolidationCreditLimit_eq preAdjustment adjustment h]
  exact Nat.sub_pos_of_lt h

-- ==== kernel-decided smoke checks ====

-- §2: 第一号 100, 第二号 200, 第三号 50 → 100 + 50 = 150
example : preAdjustmentLimit 100 200 50 = 150 := by decide
-- §2: 分母 0 → 0
example : preAdjustmentLimit 100 0 50 = 0 := by decide
-- §2: 第一号 0, 第二号 200, 第三号 50 → 50
example : preAdjustmentLimit 0 200 50 = 50 := by decide
-- §2: 第三号 0 → 第一号そのもの
example : preAdjustmentLimit 100 200 0 = 100 := by decide
-- §2: 割合が割り切れない入力（第二号 3, 第三号 1）でも乗算先行のため 100 + 1
example : preAdjustmentLimit 100 3 1 = 101 := by decide
-- §1: 調整前 500, 調整額 120 → 380
example : consolidationCreditLimit 500 120 = 380 := by decide
-- §1: 調整額 ≥ 調整前 → 0（境界: equal）
example : consolidationCreditLimit 500 500 = 0 := by decide
-- §1: 調整額 > 調整前 → 0
example : consolidationCreditLimit 500 501 = 0 := by decide
-- §1: 調整前 0 → 0
example : consolidationCreditLimit 0 100 = 0 := by decide

end JapanTaxLaw.ConsolidationCreditLimit
