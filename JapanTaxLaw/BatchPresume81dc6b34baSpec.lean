import JapanTaxLaw.BatchPresume81dc6b34ba

/-! Independent spec: conjunction form. -/
namespace JapanTaxLaw.BatchPresume81dc6b34ba

def specPresumed (e q : Bool) : Bool := e && q

theorem agree_spec_impl (e q : Bool) : specPresumed e q = presumed e q := by
  cases e <;> cases q <;> rfl

end JapanTaxLaw.BatchPresume81dc6b34ba
