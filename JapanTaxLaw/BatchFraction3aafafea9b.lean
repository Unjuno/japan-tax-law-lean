import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFraction3aafafea9b

/-- 原文 fraction: 100分の1. -/
def num : Nat := 1
def den : Nat := 100

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (num * d < den * n)

theorem sample_true : meets 1 100 = false := by decide
theorem sample_false : meets 2 100 = true := by decide

end JapanTaxLaw.BatchFraction3aafafea9b
