import JapanTaxLaw.BatchSameTr318b3c166c

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr318b3c166c

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr318b3c166c
