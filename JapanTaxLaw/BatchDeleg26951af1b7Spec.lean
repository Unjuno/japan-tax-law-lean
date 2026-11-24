import JapanTaxLaw.BatchDeleg26951af1b7

/-! Independent two-branch spec; agreement exhaustive over Bool x Nat. -/
namespace JapanTaxLaw.BatchDeleg26951af1b7

def specApplies (designated : Bool) (x : Nat) : Bool :=
  if designated then !decide (x <= limit) else false

theorem agree_spec_impl (designated : Bool) (x : Nat) :
    specApplies designated x = applies designated x := by
  cases designated
  · rfl
  · dsimp [specApplies, applies]
    by_cases h : limit < x
    · have hn : ¬ x <= limit := Nat.not_le.mpr h
      simp [h, hn]
    · have hle : x <= limit := Nat.le_of_not_gt h
      simp [h, hle]

end JapanTaxLaw.BatchDeleg26951af1b7
