import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.BatchFraction311f30ae7a

/-- 原文 fraction: 538分の468. -/
def num : Nat := 468
def den : Nat := 538

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide (num * d <= den * n)

theorem sample_true : meets 468 538 = true := by decide
theorem sample_false : meets 0 538 = false := by decide

end JapanTaxLaw.BatchFraction311f30ae7a
