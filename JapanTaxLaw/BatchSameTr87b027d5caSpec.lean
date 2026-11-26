import JapanTaxLaw.BatchSameTr87b027d5ca

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr87b027d5ca

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr87b027d5ca
