import JapanTaxLaw.BatchSameTr32c7c7fe75

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr32c7c7fe75

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr32c7c7fe75
