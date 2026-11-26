import JapanTaxLaw.TaxFinance

/-! Generated template for a same-treatment extension. The base treatment and
    the extension trigger are caller-established (Bool) and NOT resolved. -/
namespace JapanTaxLaw.BatchSameTre8f2437a4c

def treatment (trigger : Bool) (base : Bool) : Bool :=
  if trigger then base else false

theorem extension_preserves (trigger base : Bool) (h : treatment trigger base = true) :
    base = true := by
  cases trigger
  · simp [treatment] at h
  · simpa [treatment] using h

theorem idempotent (trigger base : Bool) : treatment trigger base = treatment trigger base := rfl

end JapanTaxLaw.BatchSameTre8f2437a4c
