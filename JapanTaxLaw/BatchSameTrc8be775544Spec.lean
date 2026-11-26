import JapanTaxLaw.BatchSameTrc8be775544

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrc8be775544

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrc8be775544
