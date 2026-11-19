import JapanTaxLaw.TaxFinance

/-!
# GasolineDeduction — 揮発油税法施行令 art.2（欠減控除）bounded L4 モデル

Sources (pinned):
  Law id: 332CO0000000057
  Revision: 332CO0000000057_20250401_507CO0000000006
  Raw snapshot: data/raw/332CO0000000057_20250401_507CO0000000006.law.json
  Article Num 2, flat/normalized leaf text (本則部分), U+3000 count 0.

原文逐語:
  「法第八条第一項の規定により揮発油の製造場から移出し、又は保税地域から引き取る
    揮発油の数量から控除する数量は、当該移出又は引取に係る揮発油の数量の
    百分の一・三五に相当する数量とする。」

Computation（原文逐語から導出。coordinator の数式は信じていない）:
  「百分の一・三五」= 1.35/100 = 135/10000（13.5/100 や 1.35/10 の 10 倍誤りではない）。
  deduction = quantity × 135 / 10000（切り捨て）。

Scope: 揮発油の数量は caller-established。附則の経過措置は NOT MODELLED。
-/

namespace JapanTaxLaw.GasolineDeduction

open JapanTaxLaw.TaxFinance

/-- 欠減率の分子: 一・三五 = 135（百分の一・三五を 135/10000 として表現）。 -/
def deductionNum : Money := 135
/-- 欠減率の分母: 10000。 -/
def deductionDen : Money := 10000

/-- 控除する数量 = 数量 × 135 / 10000（切り捨て）。 -/
def deduction (quantity : Money) : Money := quantity * deductionNum / deductionDen

example : deductionNum = 135 := by decide
example : deductionDen = 10000 := by decide
/-- 数量 10000 → 135（1.35%）。 -/
example : deduction 10000 = 135 := by decide
/-- 数量 1000 → 13（13 でない = 10 倍誤り回避）。 -/
example : deduction 1000 = 13 := by decide
example : deduction 0 = 0 := by decide

theorem deduction_le (quantity : Money) : deduction quantity ≤ quantity := by
  unfold deduction deductionNum deductionDen
  calc
    quantity * 135 / 10000 ≤ quantity * 10000 / 10000 :=
      Nat.div_le_div_right (Nat.mul_le_mul_left quantity (by decide : 135 ≤ 10000))
    _ = 10000 * quantity / 10000 := by rw [Nat.mul_comm]
    _ = quantity := Nat.mul_div_right quantity (by decide : 0 < 10000)

end JapanTaxLaw.GasolineDeduction
