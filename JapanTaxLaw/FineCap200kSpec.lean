import JapanTaxLaw.FineCap200k

/-! Independent spec for FineCap200k: strict `¬ 200000 < x` form. -/

namespace JapanTaxLaw.FineCap200kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 200000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.FineCap200k.withinFine x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.FineCap200k.withinFine
  unfold JapanTaxLaw.FineCap200k.fineCapYen
  simp

end JapanTaxLaw.FineCap200kSpec
