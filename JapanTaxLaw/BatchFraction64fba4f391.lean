import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFraction64fba4f391

/-- 原文 fraction: 3分の2. -/
def num : Nat := 2
def den : Nat := 3

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (num * d <= den * n)

theorem sample_true : meets 2 3 = true := by decide
theorem sample_false : meets 0 3 = false := by decide

end JapanTaxLaw.BatchFraction64fba4f391
