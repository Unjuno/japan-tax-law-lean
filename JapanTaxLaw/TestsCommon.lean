import JapanTaxLaw.TaxFinance

/-!
# TaxFinance tests — common semantics vocabulary

Decidable smoke checks for the shared types. Modeled cases only — this is
a vocabulary layer, not a law-specific model. Nothing is assumed.
-/

namespace JapanTaxLaw.TaxFinance

open Priority

-- Money arithmetic
example : ((2 + 3 : Money) : Nat) + 5 = 10 := by decide
example : ((0 : Money) : Nat) + 3 = 3 := by decide

-- TaxRate application and rounding
example : (⟨3, 10, by decide⟩ : TaxRate).applyFloor (100 : Money) = 30 := by decide
example : (⟨3, 10, by decide⟩ : TaxRate).applyCeil (100 : Money) = 30 := by decide
example : (⟨1, 3, by decide⟩ : TaxRate).applyFloor (10 : Money) = 3 := by decide
example : (⟨1, 3, by decide⟩ : TaxRate).applyCeil (10 : Money) = 4 := by decide

-- Zero-rate corner cases
example : (⟨0, 100, by decide⟩ : TaxRate).applyFloor (999 : Money) = 0 := by decide
example : (⟨0, 100, by decide⟩ : TaxRate).applyCeil (0 : Money) = 0 := by decide

-- Factor cancellation (num/den sharing a factor)
example : (⟨2 * 7, 7, by decide⟩ : TaxRate).applyFloor (5 : Money) = 10 := by decide
example : (⟨100 * 35, 35, by decide⟩ : TaxRate).applyFloor (3 : Money) = 300 := by decide

-- Larger amount (Nat is unbounded)
example : (⟨1063, 100000, by decide⟩ : TaxRate).applyFloor (123456789 : Money) = 1312345 := by
  decide

-- Period span: 2024–2027 is 4 calendar tax periods inclusive
example : (Period.mk 2024 2027 (by decide)).span = 4 := by decide
example : (Period.mk 2026 2026 (by decide)).span = 1 := by decide

-- Precedence ladder: statute > cabinet order > notice (total)
example : rank .statute = 3 := by decide
example : rank .cabinetOrder = 2 := by decide
example : rank .notice = 1 := by decide

-- beats: total displace order on the ladder
example : beats .statute .cabinetOrder := by decide
example : beats .cabinetOrder .notice := by decide
example : beats .statute .notice := by decide
example : ¬ beats .cabinetOrder .statute := by decide
example : ¬ beats .notice .notice := by decide
example : ¬ (beats .cabinetOrder .notice ∧ beats .notice .cabinetOrder) := by decide

end JapanTaxLaw.TaxFinance
