import JapanTaxLaw.TaxFinance

/-!
# MedicalExpenseDeduction — 医療費控除（地方税法 art.34 §2）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 34 §2 (医療費控除), flat/normalized leaf text 13009 chars. Needles contain no U+3000.

原文逐語（第2項）:
  「...支払つた医療費の金額...の合計額が、前年の総所得金額、退職所得金額及び山林所得金額の
   合計額の百分の五に相当する金額（その金額が十万円を超える場合には、十万円）を超える
   所得割の納税義務者その超える金額（その金額が二百万円を超える場合には、二百万円）」

Computation（原文逐語から導出、2 段の cap を持つ多段計算、単位: 円）:
  threshold = min(income * 5 / 100, 100000)
  deduction = min(paidMedical - threshold, 2000000)   （paid > threshold の場合、Nat 飽和で 0 下限）

Scope / NOT MODELLED:
  - 医療費の定義・政令で定めるもの・保険金等による埋戻し算定は NOT MODELLED。
  - 自己/配偶者/親族の範囲・総所得金額等の算定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.MedicalExpenseDeduction

open JapanTaxLaw.TaxFinance

/-- 控除の基礎となる閾値 = min(所得×5%, 10万円)。 -/
def threshold (income : Money) : Money :=
  let raw := income * 5 / 100
  if raw > 100000 then 100000 else raw

/-- 医療費控除額 = min(医療費 − 閾値, 200万円)（Nat 飽和で下限 0）。 -/
def deduction (income : Money) (paidMedical : Money) : Money :=
  let t := threshold income
  let excess := if paidMedical > t then paidMedical - t else 0
  if excess > 2000000 then 2000000 else excess

example : threshold 1000000 = 50000 := by decide
example : threshold 5000000 = 100000 := by decide  -- 25万→10万 cap
example : deduction 1000000 200000 = 150000 := by decide
example : deduction 1000000 30000 = 0 := by decide -- 閾値以下
example : deduction 1000000 3000000 = 2000000 := by decide -- 200万 cap

end JapanTaxLaw.MedicalExpenseDeduction
