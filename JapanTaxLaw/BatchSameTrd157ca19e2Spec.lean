import JapanTaxLaw.BatchSameTrd157ca19e2

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrd157ca19e2

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrd157ca19e2
