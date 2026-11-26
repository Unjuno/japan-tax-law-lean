import JapanTaxLaw.BatchSameTrf4f4b6464f

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrf4f4b6464f

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrf4f4b6464f
