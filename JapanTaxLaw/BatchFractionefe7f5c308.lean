import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFractionefe7f5c308

/-- 原文 fraction: 100分の17. -/
def num : Nat := 17
def den : Nat := 100

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (num * d < den * n)

theorem sample_true : meets 18 100 = true := by decide
theorem sample_false : meets 17 100 = false := by decide

end JapanTaxLaw.BatchFractionefe7f5c308
