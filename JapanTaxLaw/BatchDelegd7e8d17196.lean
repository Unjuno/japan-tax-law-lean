import JapanTaxLaw.TaxFinance

/-! Generated batch template for a delegation-gated threshold.
    The delegated determination is caller-established (Bool), NOT resolved. -/
namespace JapanTaxLaw.BatchDelegd7e8d17196

/-- Statutory threshold, in yen. -/
def limit : Nat := 100000000

/-- The norm applies when the delegated designation holds and the amount
    satisfies the statutory comparison. -/
def applies (designated : Bool) (x : Nat) : Bool :=
  designated && decide (limit < x)

theorem designated_at_boundary : applies true 100000000 = false := by decide
theorem undesignated_zero : applies false 0 = false := by decide

end JapanTaxLaw.BatchDelegd7e8d17196
