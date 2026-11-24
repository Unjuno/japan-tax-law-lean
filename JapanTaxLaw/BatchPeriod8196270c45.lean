import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 日. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod8196270c45

/-- Statutory period count (日). -/
def limit : Nat := 30

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (limit < x)

theorem sample_true : meets 31 = true := by decide
theorem sample_false : meets 30 = false := by decide

end JapanTaxLaw.BatchPeriod8196270c45
