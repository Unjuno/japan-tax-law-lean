import JapanTaxLaw.BatchSameTr3c1b418ce1

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr3c1b418ce1

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr3c1b418ce1
