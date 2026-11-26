import JapanTaxLaw.TaxFinance

/-! Generated template for a single-unit truncation norm.
    The amount to be rounded is caller-established (Nat). -/
namespace JapanTaxLaw.BatchRound7ebfbbb36f

/-- Rounding unit, in yen. -/
def unit : Nat := 100

/-- Statutory truncation: discard the remainder below `unit`. -/
def truncateAmount (x : Nat) : Nat := x / unit * unit

theorem below_unit_zero (x : Nat) (h : x < unit) : truncateAmount x = 0 := by
  unfold truncateAmount
  have hdiv : x / unit = 0 := Nat.div_eq_of_lt h
  rw [hdiv]
  simp

end JapanTaxLaw.BatchRound7ebfbbb36f
