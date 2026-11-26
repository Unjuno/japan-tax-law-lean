import JapanTaxLaw.BatchSameTr25f985b84b

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr25f985b84b

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr25f985b84b
