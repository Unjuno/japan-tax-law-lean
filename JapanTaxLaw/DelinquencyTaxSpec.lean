import JapanTaxLaw.DelinquencyTax

/-!
# DelinquencyTax spec — 国税通則法 art. 60（延滞税）

Sources (pinned; identical to DelinquencyTax.lean):

  Law id: 337AC0000000066
  Revision: 337AC0000000066_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01

Independent restatement of:
  * 低率 = 73/1000（年7.3%）、高率 = 146/1000（年14.6%）
  * 高率 = 2 × 低率
  * 期間区分: withinTwoMonths → 低率, そうでなければ高率
  impl が TaxRate 構造体を使うのに対し、spec は (num, den) の組で独立定式。

日割り計算・延滞税額そのものは NOT MODELLED（pinned 条文に分母の明示なし）。
Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 低率 7.3%（独立定式）。 -/
def specDelinquencyLow : Nat × Nat := (73, 1000)

/-- Spec: 高率 14.6%（独立定式）。 -/
def specDelinquencyHigh : Nat × Nat := (146, 1000)

/-- Spec: 期間区分による選択（独立定式）。 -/
def specDelinquencyRate (withinTwoMonths : Bool) : Nat × Nat :=
  if withinTwoMonths then specDelinquencyLow else specDelinquencyHigh

-- ==== points (kernel-decided) ====

example : specDelinquencyLow = (73, 1000) := by decide
example : specDelinquencyHigh = (146, 1000) := by decide
example : specDelinquencyRate true = (73, 1000) := by decide
example : specDelinquencyRate false = (146, 1000) := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeDelinquencyTax : Bool :=
  delinquencyLowRate.numDen == specDelinquencyLow
    && delinquencyHighRate.numDen == specDelinquencyHigh
    && (delinquencyRate true).numDen == specDelinquencyRate true
    && (delinquencyRate false).numDen == specDelinquencyRate false

example : agreeDelinquencyTax = true := by decide

end JapanTaxLaw
