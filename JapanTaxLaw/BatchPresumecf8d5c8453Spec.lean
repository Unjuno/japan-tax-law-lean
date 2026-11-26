import JapanTaxLaw.BatchPresumecf8d5c8453

/-! Independent spec: conjunction form. -/
namespace JapanTaxLaw.BatchPresumecf8d5c8453

def specPresumed (e q : Bool) : Bool := e && q

theorem agree_spec_impl (e q : Bool) : specPresumed e q = presumed e q := by
  cases e <;> cases q <;> rfl

end JapanTaxLaw.BatchPresumecf8d5c8453
