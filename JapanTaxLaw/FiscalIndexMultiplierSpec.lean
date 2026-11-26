import JapanTaxLaw.FiscalIndexMultiplier

/-! Independent spec: derive a tier number first, then look up the coefficient. -/

namespace JapanTaxLaw.FiscalIndexMultiplier

def tier (index100 : Nat) : Nat :=
  if index100 < 47 then 0
  else if index100 < 63 then 1
  else if index100 < 78 then 2
  else 3

def specMultiplier (index100 : Nat) : Nat × Nat :=
  match tier index100 with
  | 0 => (1, 1)
  | 1 => (2, 3)
  | 2 => (1, 3)
  | _ => (0, 1)

theorem multiplier_agrees (index100 : Nat) :
    multiplier index100 = specMultiplier index100 := by
  unfold multiplier specMultiplier tier
  by_cases h1 : index100 < 47
  · simp [h1]
  · by_cases h2 : index100 < 63
    · simp [h1, h2]
    · by_cases h3 : index100 < 78
      · simp [h1, h2, h3]
      · simp [h1, h2, h3]

theorem multiplier_denominator_pos (index100 : Nat) :
    (multiplier index100).2 > 0 := by
  unfold multiplier
  by_cases h1 : index100 < 47
  · simp [h1]
  · by_cases h2 : index100 < 63
    · simp [h1, h2]
    · by_cases h3 : index100 < 78
      · simp [h1, h2, h3]
      · simp [h1, h2, h3]

end JapanTaxLaw.FiscalIndexMultiplier
