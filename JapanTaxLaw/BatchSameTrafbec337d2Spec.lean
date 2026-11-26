import JapanTaxLaw.BatchSameTrafbec337d2

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrafbec337d2

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrafbec337d2
