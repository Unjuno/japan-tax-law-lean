import JapanTaxLaw.BatchSameTr6aae11eeeb

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr6aae11eeeb

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr6aae11eeeb
