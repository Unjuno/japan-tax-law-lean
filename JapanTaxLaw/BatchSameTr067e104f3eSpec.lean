import JapanTaxLaw.BatchSameTr067e104f3e

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr067e104f3e

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr067e104f3e
