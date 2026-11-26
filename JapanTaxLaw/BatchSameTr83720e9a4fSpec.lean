import JapanTaxLaw.BatchSameTr83720e9a4f

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr83720e9a4f

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr83720e9a4f
