import JapanTaxLaw.BatchSameTrb034569d4f

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrb034569d4f

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrb034569d4f
