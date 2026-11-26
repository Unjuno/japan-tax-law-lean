import JapanTaxLaw.BatchSameTre8f2437a4c

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTre8f2437a4c

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTre8f2437a4c
