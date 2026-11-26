import JapanTaxLaw.BatchSameTr601b4916ac

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr601b4916ac

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr601b4916ac
