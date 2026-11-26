import JapanTaxLaw.BatchSameTr14f241f85b

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr14f241f85b

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr14f241f85b
