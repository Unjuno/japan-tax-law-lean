import JapanTaxLaw.BatchPresume8643b0ac19

/-! Independent spec: conjunction form. -/
namespace JapanTaxLaw.BatchPresume8643b0ac19

def specPresumed (e q : Bool) : Bool := e && q

theorem agree_spec_impl (e q : Bool) : specPresumed e q = presumed e q := by
  cases e <;> cases q <;> rfl

end JapanTaxLaw.BatchPresume8643b0ac19
