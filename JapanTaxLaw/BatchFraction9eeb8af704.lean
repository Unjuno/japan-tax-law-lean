import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFraction9eeb8af704

/-- 原文 fraction: 5分の3. -/
def num : Nat := 3
def den : Nat := 5

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (den * n <= num * d)

theorem sample_true : meets 1 5 = true := by decide
theorem sample_false : meets 4 5 = false := by decide

end JapanTaxLaw.BatchFraction9eeb8af704
