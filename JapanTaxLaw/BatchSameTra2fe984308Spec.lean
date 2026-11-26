import JapanTaxLaw.BatchSameTra2fe984308

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTra2fe984308

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTra2fe984308
