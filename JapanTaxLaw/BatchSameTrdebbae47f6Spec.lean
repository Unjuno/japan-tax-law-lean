import JapanTaxLaw.BatchSameTrdebbae47f6

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrdebbae47f6

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrdebbae47f6
