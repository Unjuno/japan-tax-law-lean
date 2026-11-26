import JapanTaxLaw.BatchSameTr70b5f09e6f

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr70b5f09e6f

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr70b5f09e6f
