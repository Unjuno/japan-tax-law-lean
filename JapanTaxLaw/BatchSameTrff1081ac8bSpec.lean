import JapanTaxLaw.BatchSameTrff1081ac8b

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrff1081ac8b

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrff1081ac8b
