import JapanTaxLaw.BatchSameTrcf59024ae8

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrcf59024ae8

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrcf59024ae8
