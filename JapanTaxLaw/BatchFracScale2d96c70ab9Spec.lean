import JapanTaxLaw.BatchFracScale2d96c70ab9

/-! Independent plain-pair spec; agreement is universal over every Nat base. -/
namespace JapanTaxLaw.BatchFracScale2d96c70ab9

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (247, 753)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchFracScale2d96c70ab9
