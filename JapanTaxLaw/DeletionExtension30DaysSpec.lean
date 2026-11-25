import JapanTaxLaw.DeletionExtension30Days

/-! Independent spec for DeletionExtension30Days: `¬ 30 < x`. -/

namespace JapanTaxLaw.DeletionExtension30DaysSpec

def specAllowed (x : Nat) : Bool := decide (¬ 30 < x)
def agree (x : Nat) : Prop := specAllowed x = JapanTaxLaw.DeletionExtension30Days.allowed x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specAllowed JapanTaxLaw.DeletionExtension30Days.allowed JapanTaxLaw.DeletionExtension30Days.limit
  simp

end JapanTaxLaw.DeletionExtension30DaysSpec
