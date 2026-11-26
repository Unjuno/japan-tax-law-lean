import JapanTaxLaw.BatchPresume9ac55bd65b

/-! Independent spec: conjunction form. -/
namespace JapanTaxLaw.BatchPresume9ac55bd65b

def specPresumed (e q : Bool) : Bool := e && q

theorem agree_spec_impl (e q : Bool) : specPresumed e q = presumed e q := by
  cases e <;> cases q <;> rfl

end JapanTaxLaw.BatchPresume9ac55bd65b
