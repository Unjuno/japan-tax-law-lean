import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFractionf437d8dd9e

/-- 原文 fraction: 366分の1. -/
def num : Nat := 1
def den : Nat := 366

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (den * n <= num * d)

theorem sample_true : meets 1 366 = true := by decide
theorem sample_false : meets 2 366 = false := by decide

end JapanTaxLaw.BatchFractionf437d8dd9e
