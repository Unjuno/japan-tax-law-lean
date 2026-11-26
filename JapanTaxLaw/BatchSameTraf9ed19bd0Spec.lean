import JapanTaxLaw.BatchSameTraf9ed19bd0

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTraf9ed19bd0

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTraf9ed19bd0
