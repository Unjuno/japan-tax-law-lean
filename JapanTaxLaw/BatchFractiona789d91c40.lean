import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFractiona789d91c40

/-- 原文 fraction: 4分の1. -/
def num : Nat := 1
def den : Nat := 4

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (num * d <= den * n)

theorem sample_true : meets 1 4 = true := by decide
theorem sample_false : meets 0 4 = false := by decide

end JapanTaxLaw.BatchFractiona789d91c40
