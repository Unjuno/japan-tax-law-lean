import JapanTaxLaw.BatchSameTr80374e0bf4

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr80374e0bf4

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr80374e0bf4
