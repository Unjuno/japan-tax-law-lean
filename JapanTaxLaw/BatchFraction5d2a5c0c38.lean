import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFraction5d2a5c0c38

/-- 原文 fraction: 6分の1. -/
def num : Nat := 1
def den : Nat := 6

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (den * n <= num * d)

theorem sample_true : meets 1 6 = true := by decide
theorem sample_false : meets 2 6 = false := by decide

end JapanTaxLaw.BatchFraction5d2a5c0c38
