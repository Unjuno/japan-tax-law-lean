import JapanTaxLaw.BatchSameTrfbf3bff7f0

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrfbf3bff7f0

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrfbf3bff7f0
