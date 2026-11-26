import JapanTaxLaw.BatchSameTrd40ee50f32

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrd40ee50f32

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrd40ee50f32
