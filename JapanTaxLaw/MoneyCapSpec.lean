import JapanTaxLaw.MoneyCap

/-! Independent spec: if-comparison form instead of Nat.min. -/

namespace JapanTaxLaw.MoneyCap

def specCap (amount limit : Nat) : Nat :=
  if amount ≤ limit then amount else limit

theorem capAmount_agrees (amount limit : Nat) :
    capAmount amount limit = specCap amount limit := by
  unfold capAmount specCap
  by_cases h : amount ≤ limit
  · have hm : min amount limit = amount := Nat.min_eq_left h
    simp [h, hm]
  · have hm : min amount limit = limit := Nat.min_eq_right (by omega)
    simp [h, hm]

end JapanTaxLaw.MoneyCap
