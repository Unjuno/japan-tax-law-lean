import JapanTaxLaw.TaxFinance

/-! Generated template for a single statutory threshold (le). -/
namespace JapanTaxLaw.BatchMiscTh44d95d7618

def limit : Nat := 12000000

def applies (x : Nat) : Bool := decide (x ≤ limit)

theorem boundary_true : applies 12000000 = true := by
  unfold applies limit
  exact decide_eq_true_eq.mpr (Nat.le_refl 12000000)

end JapanTaxLaw.BatchMiscTh44d95d7618
