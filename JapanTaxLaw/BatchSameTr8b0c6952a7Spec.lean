import JapanTaxLaw.BatchSameTr8b0c6952a7

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr8b0c6952a7

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr8b0c6952a7
