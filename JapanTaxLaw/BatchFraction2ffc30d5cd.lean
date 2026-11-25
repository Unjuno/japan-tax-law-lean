import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFraction2ffc30d5cd

/-- 原文 fraction: 100分の20. -/
def num : Nat := 20
def den : Nat := 100

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (num * d < den * n)

theorem sample_true : meets 21 100 = true := by decide
theorem sample_false : meets 20 100 = false := by decide

end JapanTaxLaw.BatchFraction2ffc30d5cd
