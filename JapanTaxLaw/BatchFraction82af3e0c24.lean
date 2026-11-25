import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFraction82af3e0c24

/-- 原文 fraction: 10分の1. -/
def num : Nat := 1
def den : Nat := 10

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (num * d <= den * n)

theorem sample_true : meets 1 10 = true := by decide
theorem sample_false : meets 0 10 = false := by decide

end JapanTaxLaw.BatchFraction82af3e0c24
