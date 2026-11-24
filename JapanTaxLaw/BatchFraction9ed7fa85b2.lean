import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFraction9ed7fa85b2

/-- 原文 fraction: 10分の7. -/
def num : Nat := 7
def den : Nat := 10

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (den * n <= num * d)

theorem sample_true : meets 1 10 = true := by decide
theorem sample_false : meets 8 10 = false := by decide

end JapanTaxLaw.BatchFraction9ed7fa85b2
