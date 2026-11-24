import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFraction87c131f77b

/-- 原文 fraction: 100分の80. -/
def num : Nat := 80
def den : Nat := 100

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (den * n <= num * d)

theorem sample_true : meets 80 100 = true := by decide
theorem sample_false : meets 81 100 = false := by decide

end JapanTaxLaw.BatchFraction87c131f77b
