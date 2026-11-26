import JapanTaxLaw.AmountSelection

/-! Independent specs: if-comparison form, plus universal least-upper-bound /
    greatest-lower-bound characterisations (not implementation-as-spec). -/

namespace JapanTaxLaw.AmountSelection

def specGreater (a b : Nat) : Nat := if a ≤ b then b else a
def specLesser (a b : Nat) : Nat := if a ≤ b then a else b

theorem greater_agrees (a b : Nat) : greaterAmount a b = specGreater a b := by
  unfold greaterAmount specGreater
  by_cases h : a ≤ b
  · have hm : max a b = b := Nat.max_eq_right h
    simp [h, hm]
  · have hm : max a b = a := Nat.max_eq_left (by omega)
    simp [h, hm]

theorem lesser_agrees (a b : Nat) : lesserAmount a b = specLesser a b := by
  unfold lesserAmount specLesser
  by_cases h : a ≤ b
  · have hm : min a b = a := Nat.min_eq_left h
    simp [h, hm]
  · have hm : min a b = b := Nat.min_eq_right (by omega)
    simp [h, hm]

theorem greater_is_least_upper_bound (a b : Nat) :
    a ≤ greaterAmount a b ∧ b ≤ greaterAmount a b ∧
      (∀ c, a ≤ c → b ≤ c → greaterAmount a b ≤ c) := by
  unfold greaterAmount
  constructor
  · exact Nat.le_max_left a b
  · constructor
    · exact Nat.le_max_right a b
    · intro c hac hbc
      exact Nat.max_le.mpr ⟨hac, hbc⟩

theorem lesser_is_greatest_lower_bound (a b : Nat) :
    lesserAmount a b ≤ a ∧ lesserAmount a b ≤ b ∧
      (∀ c, c ≤ a → c ≤ b → c ≤ lesserAmount a b) := by
  unfold lesserAmount
  constructor
  · exact Nat.min_le_left a b
  · constructor
    · exact Nat.min_le_right a b
    · intro c hca hcb
      exact Nat.le_min.mpr ⟨hca, hcb⟩

end JapanTaxLaw.AmountSelection
