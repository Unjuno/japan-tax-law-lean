import JapanTaxLaw.BatchSameTr8922911afa

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr8922911afa

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr8922911afa
