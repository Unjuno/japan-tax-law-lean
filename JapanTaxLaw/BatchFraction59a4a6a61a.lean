import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFraction59a4a6a61a

/-- 原文 fraction: 100分の15. -/
def num : Nat := 15
def den : Nat := 100

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (num * d <= den * n)

theorem sample_true : meets 15 100 = true := by decide
theorem sample_false : meets 0 100 = false := by decide

end JapanTaxLaw.BatchFraction59a4a6a61a
