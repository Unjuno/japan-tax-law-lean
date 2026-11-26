import JapanTaxLaw.BatchPresumeec73948b8f

/-! Independent spec: conjunction form. -/
namespace JapanTaxLaw.BatchPresumeec73948b8f

def specPresumed (e q : Bool) : Bool := e && q

theorem agree_spec_impl (e q : Bool) : specPresumed e q = presumed e q := by
  cases e <;> cases q <;> rfl

end JapanTaxLaw.BatchPresumeec73948b8f
