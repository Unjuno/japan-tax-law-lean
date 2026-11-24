import JapanTaxLaw.BatchDelegc29f567527

/-! Independent two-branch spec; agreement exhaustive over Bool x Nat. -/
namespace JapanTaxLaw.BatchDelegc29f567527

def specApplies (designated : Bool) (x : Nat) : Bool :=
  if designated then !decide (limit < x) else false

theorem agree_spec_impl (designated : Bool) (x : Nat) :
    specApplies designated x = applies designated x := by
  cases designated
  · rfl
  · dsimp [specApplies, applies]
    by_cases h : x <= limit
    · have hn : ¬ limit < x := Nat.not_lt.mpr h
      simp [h, hn]
    · have hle : limit < x := Nat.lt_of_not_ge h
      simp [h, hle]

end JapanTaxLaw.BatchDelegc29f567527
