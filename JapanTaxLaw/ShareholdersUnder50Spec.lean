import JapanTaxLaw.ShareholdersUnder50

/-! Independent spec for ShareholdersUnder50: strict `¬ 50 <= x` form. -/

namespace JapanTaxLaw.ShareholdersUnder50Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ 50 <= x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.ShareholdersUnder50.hasUnder50Shareholders x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.ShareholdersUnder50.hasUnder50Shareholders
  unfold JapanTaxLaw.ShareholdersUnder50.shareholderLimit50
  simp

end JapanTaxLaw.ShareholdersUnder50Spec
