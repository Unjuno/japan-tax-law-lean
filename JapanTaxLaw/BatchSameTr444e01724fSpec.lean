import JapanTaxLaw.BatchSameTr444e01724f

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr444e01724f

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr444e01724f
