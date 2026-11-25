import JapanTaxLaw.PowerDevelopmentTaxPenalty

/-!
# PowerDevelopmentTaxPenalty spec — 独立定式 (art.12(4))

Spec uses the opposite conditional orientation over its own constant. The
universal correspondence theorem quantifies over every Nat amount.
-/

namespace JapanTaxLaw.PowerDevelopmentTaxPenalty

open JapanTaxLaw.TaxFinance

def specFloorYen : Money := 500_000

def specUpper (equivalentTax : Money) : Money :=
  if equivalentTax <= specFloorYen then specFloorYen else equivalentTax

theorem agreeUpper (equivalentTax : Money) :
    specUpper equivalentTax = upperFine equivalentTax := by
  unfold specUpper upperFine specFloorYen standardMinYen
  by_cases h : 500_000 < equivalentTax
  · have hle : ¬ equivalentTax <= 500_000 := Nat.not_le_of_gt h
    simp [h, hle]
  · have hle : equivalentTax <= 500_000 := Nat.le_of_not_gt h
    simp [h, hle]

example : specUpper 499_999 = 500_000 := by decide
example : specUpper 500_001 = 500_001 := by decide

end JapanTaxLaw.PowerDevelopmentTaxPenalty
