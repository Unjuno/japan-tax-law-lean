import JapanTaxLaw.BatchSameTreaefe5af55

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTreaefe5af55

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTreaefe5af55
