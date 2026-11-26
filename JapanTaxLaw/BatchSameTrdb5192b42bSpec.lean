import JapanTaxLaw.BatchSameTrdb5192b42b

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrdb5192b42b

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrdb5192b42b
