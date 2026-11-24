import JapanTaxLaw.BatchLoweraff0cda02a

/-! Independent restatement: negation of strict below-bound comparison.
    Agreement is universal over all Nat amounts. -/
namespace JapanTaxLaw.BatchLoweraff0cda02a

def specMeets (x : Nat) : Bool := !decide (x < lowerYen)

theorem agree_spec_impl (x : Nat) : specMeets x = meets x := by
  unfold specMeets meets
  by_cases h : lowerYen <= x
  · have hn : ¬ x < lowerYen := Nat.not_lt.mpr h
    simp [h, hn]
  · have hlt : x < lowerYen := Nat.lt_of_not_ge h
    simp [h, hlt]

end JapanTaxLaw.BatchLoweraff0cda02a
