import JapanTaxLaw.ShareExchange50Plus

/-! Independent spec for ShareExchange50Plus: strict `¬ x < 50` form. -/

namespace JapanTaxLaw.ShareExchange50PlusSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 50)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.ShareExchange50Plus.atLeast50 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.ShareExchange50Plus.atLeast50
  unfold JapanTaxLaw.ShareExchange50Plus.shareFloor50
  simp

end JapanTaxLaw.ShareExchange50PlusSpec
