import JapanTaxLaw.BatchSameTrb9f0ac3ab7

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrb9f0ac3ab7

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrb9f0ac3ab7
