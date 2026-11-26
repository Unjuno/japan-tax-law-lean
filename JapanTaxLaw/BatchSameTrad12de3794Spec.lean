import JapanTaxLaw.BatchSameTrad12de3794

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrad12de3794

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrad12de3794
