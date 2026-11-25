import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFraction4b1ba72145

/-- 原文 fraction: 100分の98. -/
def num : Nat := 98
def den : Nat := 100

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (num * d < den * n)

theorem sample_true : meets 99 100 = true := by decide
theorem sample_false : meets 98 100 = false := by decide

end JapanTaxLaw.BatchFraction4b1ba72145
