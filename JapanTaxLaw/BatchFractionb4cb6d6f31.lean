import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFractionb4cb6d6f31

/-- 原文 fraction: 100分の5. -/
def num : Nat := 5
def den : Nat := 100

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (den * n <= num * d)

theorem sample_true : meets 5 100 = true := by decide
theorem sample_false : meets 6 100 = false := by decide

end JapanTaxLaw.BatchFractionb4cb6d6f31
