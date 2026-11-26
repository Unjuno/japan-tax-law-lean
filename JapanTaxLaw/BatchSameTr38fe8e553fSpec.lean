import JapanTaxLaw.BatchSameTr38fe8e553f

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr38fe8e553f

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr38fe8e553f
