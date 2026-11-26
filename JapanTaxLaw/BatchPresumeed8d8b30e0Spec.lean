import JapanTaxLaw.BatchPresumeed8d8b30e0

/-! Independent spec: conjunction form. -/
namespace JapanTaxLaw.BatchPresumeed8d8b30e0

def specPresumed (e q : Bool) : Bool := e && q

theorem agree_spec_impl (e q : Bool) : specPresumed e q = presumed e q := by
  cases e <;> cases q <;> rfl

end JapanTaxLaw.BatchPresumeed8d8b30e0
