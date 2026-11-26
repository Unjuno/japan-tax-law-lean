import JapanTaxLaw.BatchSameTrce0a0d6914

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrce0a0d6914

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrce0a0d6914
