import JapanTaxLaw.TaxFinance

/-! Generated template for a calculated commencement norm (bounded).
    The delegated day / promulgation day is caller-established and NOT resolved.
    No calendar arithmetic is modelled. -/
namespace JapanTaxLaw.BatchCommencef59be272a5

/-- Abstract period bound (years/months/days recorded from the text). -/
def periodLimit : Nat := 1

/-- The delegated commencement day must lie within the statutory bound. -/
def withinLimit (delegated : Nat) : Bool := decide (delegated ≤ periodLimit)

theorem at_limit (d : Nat) : withinLimit d = true → d ≤ periodLimit := by
  intro h
  change decide (d ≤ periodLimit) = true at h
  exact decide_eq_true_eq.mp h

theorem below_limit_true (d : Nat) (h : d ≤ periodLimit) : withinLimit d = true := by
  change decide (d ≤ periodLimit) = true
  exact decide_eq_true_eq.mpr h
end JapanTaxLaw.BatchCommencef59be272a5
