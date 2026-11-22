import JapanTaxLaw.Members500k

/-! Independent spec for Members500k: strict `¬ x < 500000` form. -/

namespace JapanTaxLaw.Members500kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 500000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.Members500k.hasMembers500k x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.Members500k.hasMembers500k
  unfold JapanTaxLaw.Members500k.memberFloor500k
  simp

end JapanTaxLaw.Members500kSpec
