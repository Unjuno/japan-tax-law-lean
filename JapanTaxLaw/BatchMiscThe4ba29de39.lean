import JapanTaxLaw.TaxFinance

/-! Generated template for a single statutory threshold (le). -/
namespace JapanTaxLaw.BatchMiscThe4ba29de39

def limit : Nat := 200000

def applies (x : Nat) : Bool := decide (x ≤ limit)

theorem boundary_true : applies 200000 = true := by
  unfold applies limit
  exact decide_eq_true_eq.mpr (Nat.le_refl 200000)

end JapanTaxLaw.BatchMiscThe4ba29de39
