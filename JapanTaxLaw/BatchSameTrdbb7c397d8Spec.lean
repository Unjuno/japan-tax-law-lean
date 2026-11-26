import JapanTaxLaw.BatchSameTrdbb7c397d8

/-! Independent spec: explicit conjunction form. -/
namespace JapanTaxLaw.BatchSameTrdbb7c397d8

def specTreatment (trigger base : Bool) : Bool := trigger && base

theorem agree_spec_impl (trigger base : Bool) :
    specTreatment trigger base = treatment trigger base := by
  cases trigger <;> cases base <;> rfl

end JapanTaxLaw.BatchSameTrdbb7c397d8
