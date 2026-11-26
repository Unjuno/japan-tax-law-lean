import JapanTaxLaw.BatchSameTrfdcd149f0f

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrfdcd149f0f

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrfdcd149f0f
