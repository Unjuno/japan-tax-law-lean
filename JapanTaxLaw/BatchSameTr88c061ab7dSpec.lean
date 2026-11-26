import JapanTaxLaw.BatchSameTr88c061ab7d

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr88c061ab7d

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr88c061ab7d
