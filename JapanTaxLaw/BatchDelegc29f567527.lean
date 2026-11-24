import JapanTaxLaw.TaxFinance

/-! Generated batch template for a delegation-gated threshold.
    The delegated determination is caller-established (Bool), NOT resolved. -/
namespace JapanTaxLaw.BatchDelegc29f567527

/-- Statutory threshold, in yen. -/
def limit : Nat := 10000000

/-- The norm applies when the delegated designation holds and the amount
    satisfies the statutory comparison. -/
def applies (designated : Bool) (x : Nat) : Bool :=
  designated && decide (x <= limit)

theorem designated_at_boundary : applies true 10000000 = true := by decide
theorem undesignated_zero : applies false 0 = false := by decide

end JapanTaxLaw.BatchDelegc29f567527
