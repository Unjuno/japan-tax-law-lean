import JapanTaxLaw.BatchSameTrd45a92595b

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrd45a92595b

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrd45a92595b
