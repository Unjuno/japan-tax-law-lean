import JapanTaxLaw.BatchSameTraf7a5d43cb

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTraf7a5d43cb

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTraf7a5d43cb
