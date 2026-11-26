import JapanTaxLaw.BatchDecRatedb5b062835

/-! Independent plain-pair spec; agreement is universal over every base. -/
namespace JapanTaxLaw.BatchDecRatedb5b062835

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (753, 1000)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchDecRatedb5b062835
