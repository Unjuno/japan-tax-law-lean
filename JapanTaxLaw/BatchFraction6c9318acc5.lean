import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFraction6c9318acc5

/-- 原文 fraction: 2分の1. -/
def num : Nat := 1
def den : Nat := 2

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (num * d <= den * n)

theorem sample_true : meets 1 2 = true := by decide
theorem sample_false : meets 0 2 = false := by decide

end JapanTaxLaw.BatchFraction6c9318acc5
