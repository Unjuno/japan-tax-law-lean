import JapanTaxLaw.BatchSameTra753497d50

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTra753497d50

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTra753497d50
