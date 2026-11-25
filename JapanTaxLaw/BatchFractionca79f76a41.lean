import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFractionca79f76a41

/-- 原文 fraction: 10分の5. -/
def num : Nat := 5
def den : Nat := 10

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (num * d < den * n)

theorem sample_true : meets 6 10 = true := by decide
theorem sample_false : meets 5 10 = false := by decide

end JapanTaxLaw.BatchFractionca79f76a41
