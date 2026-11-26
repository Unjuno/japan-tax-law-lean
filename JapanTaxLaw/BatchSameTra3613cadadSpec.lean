import JapanTaxLaw.BatchSameTra3613cadad

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTra3613cadad

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTra3613cadad
