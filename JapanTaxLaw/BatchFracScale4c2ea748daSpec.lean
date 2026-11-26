import JapanTaxLaw.BatchFracScale4c2ea748da

/-! Independent plain-pair spec; agreement is universal over every Nat base. -/
namespace JapanTaxLaw.BatchFracScale4c2ea748da

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (1, 4)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchFracScale4c2ea748da
