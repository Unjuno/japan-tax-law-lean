import JapanTaxLaw.BatchSameTrc2d3c2e606

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrc2d3c2e606

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrc2d3c2e606
