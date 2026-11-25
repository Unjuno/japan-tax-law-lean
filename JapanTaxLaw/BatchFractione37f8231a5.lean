import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFractione37f8231a5

/-- 原文 fraction: 100分の15. -/
def num : Nat := 15
def den : Nat := 100

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (den * n <= num * d)

theorem sample_true : meets 15 100 = true := by decide
theorem sample_false : meets 16 100 = false := by decide

end JapanTaxLaw.BatchFractione37f8231a5
