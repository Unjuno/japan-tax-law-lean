import JapanTaxLaw.TaxFinance

/-! Generated template for a single statutory threshold (lt). -/
namespace JapanTaxLaw.BatchMiscTh5d2780ddcd

def limit : Nat := 500000

def applies (x : Nat) : Bool := decide (x < limit)

theorem boundary_true : applies 499999 = true := by
  unfold applies limit
  exact decide_eq_true_eq.mpr (Nat.lt.base 499999)

end JapanTaxLaw.BatchMiscTh5d2780ddcd
