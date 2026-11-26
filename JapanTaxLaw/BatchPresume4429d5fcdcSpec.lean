import JapanTaxLaw.BatchPresume4429d5fcdc

/-! Independent spec: conjunction form. -/
namespace JapanTaxLaw.BatchPresume4429d5fcdc

def specPresumed (e q : Bool) : Bool := e && q

theorem agree_spec_impl (e q : Bool) : specPresumed e q = presumed e q := by
  cases e <;> cases q <;> rfl

end JapanTaxLaw.BatchPresume4429d5fcdc
