import JapanTaxLaw.BatchSameTra5d5c5b643

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTra5d5c5b643

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTra5d5c5b643
