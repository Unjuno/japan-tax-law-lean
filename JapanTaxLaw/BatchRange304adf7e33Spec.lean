import JapanTaxLaw.BatchRange304adf7e33

/-! Independent restatement: two negated comparisons joined by Bool AND.
    Agreement is universal over all Nat amounts. -/
namespace JapanTaxLaw.BatchRange304adf7e33

def specInRange (x : Nat) : Bool :=
  (!decide (x <= lowerYen)) && (!decide (upperYen < x))

theorem agree_spec_impl (x : Nat) : specInRange x = inRange x := by
  unfold specInRange inRange
  by_cases h1 : lowerYen < x
  · by_cases h2 : x <= upperYen
    · simp [h1, h2]
    · have h2n : upperYen < x := Nat.lt_of_not_ge h2
      simp [h1, h2, h2n]
  · have h1n : x <= lowerYen := Nat.le_of_not_gt h1
    simp [h1, h1n]

end JapanTaxLaw.BatchRange304adf7e33
