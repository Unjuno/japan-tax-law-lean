import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFraction6c085d0177

/-- 原文 fraction: 3分の1. -/
def num : Nat := 1
def den : Nat := 3

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (num * d <= den * n)

theorem sample_true : meets 1 3 = true := by decide
theorem sample_false : meets 0 3 = false := by decide

end JapanTaxLaw.BatchFraction6c085d0177
