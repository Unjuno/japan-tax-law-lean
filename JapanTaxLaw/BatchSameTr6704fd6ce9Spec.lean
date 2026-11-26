import JapanTaxLaw.BatchSameTr6704fd6ce9

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr6704fd6ce9

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr6704fd6ce9
