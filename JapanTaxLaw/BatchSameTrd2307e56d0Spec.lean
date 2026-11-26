import JapanTaxLaw.BatchSameTrd2307e56d0

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrd2307e56d0

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrd2307e56d0
