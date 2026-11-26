import JapanTaxLaw.BatchSameTr3ef204de60

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr3ef204de60

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr3ef204de60
