import JapanTaxLaw.TaxFinance

/-! Generated template for a single statutory threshold (lt). -/
namespace JapanTaxLaw.BatchMiscTh503b1a7d55

def limit : Nat := 10000000

def applies (x : Nat) : Bool := decide (x < limit)

theorem boundary_true : applies 9999999 = true := by
  unfold applies limit
  exact decide_eq_true_eq.mpr (Nat.lt.base 9999999)

end JapanTaxLaw.BatchMiscTh503b1a7d55
