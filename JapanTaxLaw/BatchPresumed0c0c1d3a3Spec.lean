import JapanTaxLaw.BatchPresumed0c0c1d3a3

/-! Independent spec: conjunction form. -/
namespace JapanTaxLaw.BatchPresumed0c0c1d3a3

def specPresumed (e q : Bool) : Bool := e && q

theorem agree_spec_impl (e q : Bool) : specPresumed e q = presumed e q := by
  cases e <;> cases q <;> rfl

end JapanTaxLaw.BatchPresumed0c0c1d3a3
