import JapanTaxLaw.BatchSameTr78efa2d5e9

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr78efa2d5e9

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr78efa2d5e9
