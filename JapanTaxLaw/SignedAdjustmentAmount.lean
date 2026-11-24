import JapanTaxLaw.TaxFinance

/-
# SignedAdjustmentAmount — 地方団体に対して交付すべき令和七年度分の震災復興特別交付税の額の算定方法、決定時期及び決定額並びに交付時期及び交付額等の特例に関する省令 第五条（符号付き調整額の算定）

Pinned source:
  Law id: 507M60000008043
  Official title: 地方団体に対して交付すべき令和七年度分の震災復興特別交付税の額の算定方法、決定時期及び決定額並びに交付時期及び交付額等の特例に関する省令
  Law type: MinisterialOrdinance (省令)
  Revision: 507M60000008043_20250425_000000000000000
  Raw snapshot: data/raw/507M60000008043_20250425_000000000000000.law.json
  sha256: 02d256b8f5b48afc01a886eebb88ed78eec7d84d4726a543088115ba8f32f60e
  Article: 第五条 (e-Gov Num = 5)

原文逐語（pinned, 一字一句改変なし）:
  「令和八年三月において、令和七年度三月震災復興特別交付税額は、前条の規定によって算定した額から第一号の額を減額した後の額に第二号の額を加算した額（同号の額が負数となるときは、当該負数となる額に相当する額を減額した額）から第三号の額を減額した額とする。」

Variable contract:
  base  : Nat — 前条の規定によって算定した額 (円)
  item1 : Nat — 第一号の額 (円, 減額)
  item2 : Int — 第二号の額 (円, 加算; 負数となり得る — 負数のときはその絶対値を減額する)
  item3 : Nat — 第三号の額 (円, 減額)
  targetYear  = 8 (令和八年)    — 算定を行う時点の年
  targetMonth = 3 (三月)        — 算定を行う時点の月
  baseYear    = 7 (令和七年度)  — 交付税額の対象年度
  grantAmount base item1 item2 item3 = (base : Int) - (item1 : Int) + item2 - (item3 : Int)

  The parenthetical 「同号の額が負数となるときは、当該負数となる額に相当する額を減額した額」
  states that when 第二号の額 is negative, the amount equal to that negative number
  is DEDUCTED — i.e. its absolute value is subtracted. Adding item2 : Int directly
  contributes -|item2| when item2 < 0, which is exactly that statutory deduction.
  The chain therefore returns a SIGNED amount (Int): a negative adjustment is
  meaningful and is not floored to zero.

Scope: only the four-step signed-adjustment chain and its timing/fiscal-year
constants are modelled. The prior-article computation of base, the definitions
of 第一号/第二号/第三号, and the other paragraphs are NOT MODELLED.

All proofs are kernel reduction (`rfl`) or kernel decision (`by decide`);
no escape hatches, no case splits, no order-theory abstractions, no added foundational assumptions.
-/

namespace JapanTaxLaw.SignedAdjustmentAmount

/-- 令和八年 — the year in which the computation is performed. -/
def targetYear : Nat := 8

/-- 三月 — the month in which the computation is performed. -/
def targetMonth : Nat := 3

/-- 令和七年度 — the fiscal year of the 震災復興特別交付税額. -/
def baseYear : Nat := 7

/-- 符号付き調整額の算定: (base : Int) - item1 + item2 - item3. -/
def grantAmount (base : Nat) (item1 : Nat) (item2 : Int) (item3 : Nat) : Int :=
  (base : Int) - (item1 : Int) + item2 - (item3 : Int)

theorem targetYear_value : targetYear = 8 := rfl
theorem targetMonth_value : targetMonth = 3 := rfl
theorem baseYear_value : baseYear = 7 := rfl

theorem grantAmount_positive_item2 : grantAmount 100 10 5 3 = 92 := by decide
theorem grantAmount_negative_item2 : grantAmount 100 10 (-5) 3 = 82 := by decide
theorem grantAmount_large_item3 : grantAmount 100 10 5 20 = 75 := by decide
theorem grantAmount_zero : grantAmount 0 0 0 0 = 0 := by decide

end JapanTaxLaw.SignedAdjustmentAmount
