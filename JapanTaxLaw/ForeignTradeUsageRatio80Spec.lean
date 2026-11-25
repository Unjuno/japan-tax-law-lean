import JapanTaxLaw.ForeignTradeUsageRatio80

/-! Independent spec for ForeignTradeUsageRatio80: `¬ x <= 80`. -/

namespace JapanTaxLaw.ForeignTradeUsageRatio80Spec

def specTriggered (x : Nat) : Bool := decide (¬ x <= 80)
def agree (x : Nat) : Prop := specTriggered x = JapanTaxLaw.ForeignTradeUsageRatio80.triggered x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specTriggered JapanTaxLaw.ForeignTradeUsageRatio80.triggered JapanTaxLaw.ForeignTradeUsageRatio80.threshold
  simp

end JapanTaxLaw.ForeignTradeUsageRatio80Spec
