import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFraction8bc0a96d0d

/-- 原文 fraction: 100分の50. -/
def num : Nat := 50
def den : Nat := 100

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (den * n <= num * d)

theorem sample_true : meets 50 100 = true := by decide
theorem sample_false : meets 51 100 = false := by decide

end JapanTaxLaw.BatchFraction8bc0a96d0d
