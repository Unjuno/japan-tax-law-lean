import JapanTaxLaw.BatchSameTre1aa211f71

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTre1aa211f71

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTre1aa211f71
