import JapanTaxLaw.BatchSameTr05bb87ce47

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTr05bb87ce47

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTr05bb87ce47
