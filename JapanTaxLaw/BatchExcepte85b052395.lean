import JapanTaxLaw.TaxFinance

/-! Generated template for a simple exception gate. The trigger is
    caller-established (Bool) and is NOT resolved by this pipeline. -/
namespace JapanTaxLaw.BatchExcepte85b052395

/-- The rule applies unless the stated exception triggers. -/
def effectApplies (trigger : Bool) : Bool := !trigger

theorem exception_excludes (t : Bool) : effectApplies t = true → t = false := by
  intro h
  cases t <;> simp [effectApplies] at h ⊢

theorem trigger_disables (t : Bool) : effectApplies t = !t := by rfl

end JapanTaxLaw.BatchExcepte85b052395
