import JapanTaxLaw.BatchSameTr11e9fc3beb

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr11e9fc3beb

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr11e9fc3beb
