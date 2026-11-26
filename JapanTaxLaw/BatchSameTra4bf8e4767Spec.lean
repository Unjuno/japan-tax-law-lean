import JapanTaxLaw.BatchSameTra4bf8e4767

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTra4bf8e4767

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTra4bf8e4767
