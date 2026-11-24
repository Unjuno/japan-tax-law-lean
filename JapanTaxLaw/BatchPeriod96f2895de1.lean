import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 日. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod96f2895de1

/-- Statutory period count (日). -/
def limit : Nat := 15

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 15 = true := by decide
theorem sample_false : meets 16 = false := by decide

end JapanTaxLaw.BatchPeriod96f2895de1
