import JapanTaxLaw.BatchPresumeb783f1bf82

/-! Independent spec: conjunction form. -/
namespace JapanTaxLaw.BatchPresumeb783f1bf82

def specPresumed (e q : Bool) : Bool := e && q

theorem agree_spec_impl (e q : Bool) : specPresumed e q = presumed e q := by
  cases e <;> cases q <;> rfl

end JapanTaxLaw.BatchPresumeb783f1bf82
