import JapanTaxLaw.LocalAddedValueStandard

/-!
# LocalAddedValueStandardSpec — 地方税法 art. 72の20 の独立整数定式

Sources (pinned; identical to LocalAddedValueStandard.lean):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01

Independent restatement of the modelled computation:

  * art. 72の20(1)「割合が百分の七十を超える」
      impl: `decide (salary * 100 > 70 * distribution)`
      spec: `decide (70 * distribution < salary * 100)`
    — 両辺を入れ替え `>` を `<` にした形で書き直し、定式を独立に保つ。
  * art. 72の20(2) 雇用安定控除額
      impl: `salary - distribution * 70 / 100`
      spec: `salary - distribution * 7 / 10`
    — 百分の七十 = 十分の七 と既約分数に落として計算する独立定式。
    （自然数除算では `(d * 70) / 100 = (d * 7) / 10` であり、有限サンプル上で一致を確認。）
  * art. 72の20(1) 課税標準
      impl: `addedValue - deduction`（Nat の飽和減算）
      spec: `if deduction ≤ addedValue then addedValue - deduction else 0`
    — 飽和減算を条件分岐で書き下した独立定式。

`agree*` は有限サンプル上の `==` 一致確認であり、法的意味の等価証明ではない。

Scope boundaries identical to the implementation. 前条の控除額・付加価値額・
報酬給与額・収益配分額・該当性はすべて caller-established、
3項の政令みなし額は NOT MODELLED（impl の doc-comment 参照）。

-/

namespace JapanTaxLaw.LocalAddedValueStandard

open JapanTaxLaw.TaxFinance

-- ==== independent formulas ====

/-- Spec: art. 72の20(1) の「百分の七十を超える」判定（独立定式）。
    impl の `salary * 100 > 70 * distribution` を
    `70 * distribution < salary * 100` と書き換えた形。 -/
def specSalaryRatioExceeds70 (distribution salary : Money) : Bool :=
  decide (70 * distribution < salary * 100)

/-- Spec: art. 72の20(2) の雇用安定控除額（独立定式）。
    百分の七十を十分の七に約分した `salary - distribution * 7 / 10`。 -/
def specEmploymentStabilityDeduction (distribution salary : Money) : Money :=
  salary - distribution * 7 / 10

/-- Spec: art. 72の20(1) の課税標準（独立定式）。
    Nat の飽和減算を条件分岐で書き下した形。 -/
def specAddedValueStandard (addedValue deduction : Money) : Money :=
  if deduction ≤ addedValue then addedValue - deduction else 0

-- ==== points (kernel-decided) ====

-- 境界: ちょうど 70% → false、70% 超 → true
example : specSalaryRatioExceeds70 100 70 = false := by decide
example : specSalaryRatioExceeds70 100 71 = true := by decide
example : specSalaryRatioExceeds70 1000 700 = false := by decide
example : specSalaryRatioExceeds70 1000 701 = true := by decide
-- 収益配分額零
example : specSalaryRatioExceeds70 0 0 = false := by decide
example : specSalaryRatioExceeds70 0 1 = true := by decide

-- 第2項・第1項の代表点
example : specEmploymentStabilityDeduction 100 71 = 1 := by decide
example : specEmploymentStabilityDeduction 100 10 = 0 := by decide
example : specAddedValueStandard 1000 70 = 930 := by decide
example : specAddedValueStandard 50 100 = 0 := by decide

-- ==== agreement checks between implementation and Spec ====

/-- art. 72の20(1): impl ≡ spec（有限サンプル上の `==` 一致）。 -/
def agreeSalaryRatioExceeds70 : Bool :=
  [ (0, 0), (0, 1), (100, 69), (100, 70), (100, 71),
    (1000, 700), (1000, 701), (1, 0), (1, 1), (3, 2), (7, 5),
    (299, 100), (300, 100), (301, 100) ].all fun (d, s) =>
      salaryRatioExceeds70 d s == specSalaryRatioExceeds70 d s

example : agreeSalaryRatioExceeds70 = true := by decide

/-- art. 72の20(2): impl ≡ spec（有限サンプル上の `==` 一致）。
    `(101, 71)` は 70/100 と 7/10 の切り捨て差が出得る境界確認点。 -/
def agreeEmploymentStabilityDeduction : Bool :=
  [ (0, 0), (0, 50), (100, 70), (100, 71), (100, 10), (101, 71),
    (1000, 999), (7, 5), (10, 7), (1, 0), (10000, 7001) ].all fun (d, s) =>
      employmentStabilityDeduction d s == specEmploymentStabilityDeduction d s

example : agreeEmploymentStabilityDeduction = true := by decide

/-- art. 72の20(1) 課税標準: impl ≡ spec（有限サンプル上の `==` 一致）。 -/
def agreeAddedValueStandard : Bool :=
  [ (0, 0), (0, 1), (50, 100), (1000, 70), (100, 100),
    (100, 101), (7, 5), (5, 7), (1, 0) ].all fun (a, d) =>
      addedValueStandard a d == specAddedValueStandard a d

example : agreeAddedValueStandard = true := by decide

end JapanTaxLaw.LocalAddedValueStandard
