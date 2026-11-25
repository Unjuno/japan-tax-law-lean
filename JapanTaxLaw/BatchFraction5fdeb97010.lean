import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFraction5fdeb97010

/-- 原文 fraction: 100分の30. -/
def num : Nat := 30
def den : Nat := 100

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (den * n <= num * d)

theorem sample_true : meets 30 100 = true := by decide
theorem sample_false : meets 31 100 = false := by decide

end JapanTaxLaw.BatchFraction5fdeb97010
