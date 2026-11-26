import JapanTaxLaw.BatchSameTrf98a4b9e1a

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrf98a4b9e1a

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrf98a4b9e1a
