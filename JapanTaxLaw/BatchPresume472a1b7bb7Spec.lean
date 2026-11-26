import JapanTaxLaw.BatchPresume472a1b7bb7

/-! Independent spec: conjunction form. -/
namespace JapanTaxLaw.BatchPresume472a1b7bb7

def specPresumed (e q : Bool) : Bool := e && q

theorem agree_spec_impl (e q : Bool) : specPresumed e q = presumed e q := by
  cases e <;> cases q <;> rfl

end JapanTaxLaw.BatchPresume472a1b7bb7
