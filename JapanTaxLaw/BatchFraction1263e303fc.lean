import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFraction1263e303fc

/-- 原文 fraction: 4分の3. -/
def num : Nat := 3
def den : Nat := 4

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (num * d <= den * n)

theorem sample_true : meets 3 4 = true := by decide
theorem sample_false : meets 0 4 = false := by decide

end JapanTaxLaw.BatchFraction1263e303fc
