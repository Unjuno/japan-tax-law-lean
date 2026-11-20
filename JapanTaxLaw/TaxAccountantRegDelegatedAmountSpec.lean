import JapanTaxLaw.TaxAccountantRegDelegatedAmount

/-!
# TaxAccountantRegDelegatedAmountSpec — independent spec for 税理士法施行令 art.6の2(2)

Law id: 326CO0000000216 (税理士法施行令, Cabinet Order)
Revision: 326CO0000000216_20240401_505CO0000000146
Statutory article: art.6の2(2) — 税理士法9条2項の政令で定める額 = 八千八百円
Normative unit: NORM|5a5e264f44439540b3d5bdd4efa72bc7e2980f2b11cd22c3acb7863e8cb240a7

The implementation uses the equality predicate `amount = delegatedAmountYen`
(with `delegatedAmountYen = 8_800`). The independent spec reformulates it as
degenerate-interval membership `8_800 ≤ amount ∧ amount ≤ 8_800` — a distinct
formulation. The kernel proves equivalence for ALL amounts.

Boundary theorems (exactly ¥8,800 qualifies; ¥8,799 and ¥8,801 fail) are
universal where appropriate.

Not modelled: the substantive 税理士法 art.9(2), the conditions under which the
amount applies, other paragraphs, 省令 details.
-/

namespace JapanTaxLaw.TaxAccountantRegDelegatedAmount

open JapanTaxLaw.TaxFinance

/-- Independent spec: membership in the degenerate interval [8800, 8800]. -/
def specIsDelegatedAmount (amount : Money) : Prop :=
  delegatedAmountYen ≤ amount ∧ amount ≤ delegatedAmountYen

/-- Correspondence for all amounts. Universal, kernel-checked. -/
theorem agree_delegated_amount (amount : Money) :
    isDelegatedAmount amount ↔ specIsDelegatedAmount amount := by
  unfold isDelegatedAmount specIsDelegatedAmount
  constructor
  · intro h
    subst amount
    exact ⟨Nat.le_refl _, Nat.le_refl _⟩
  · intro h
    exact Nat.le_antisymm h.2 h.1

/-- Boundary: exactly ¥8,800 is the delegated amount. -/
theorem at_delegated : isDelegatedAmount delegatedAmountYen := by
  unfold isDelegatedAmount
  rfl

/-- Boundary: ¥8,799 is not the delegated amount. -/
theorem below_delegated : ¬ isDelegatedAmount 8_799 := by
  unfold isDelegatedAmount delegatedAmountYen
  decide

/-- Boundary: ¥8,801 is not the delegated amount. -/
theorem above_delegated : ¬ isDelegatedAmount 8_801 := by
  unfold isDelegatedAmount delegatedAmountYen
  decide

/-- The delegated amount is exactly ¥8,800 (八千八百円). -/
theorem amount_is_eight_thousand_eight_hundred : delegatedAmountYen = 8_800 := rfl

end JapanTaxLaw.TaxAccountantRegDelegatedAmount
