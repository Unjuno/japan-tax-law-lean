import JapanTaxLaw.LocalTaxOrderArt15_4Amount

/-!
# LocalTaxOrderArt15_4AmountSpec — independent spec for 地方税法施行令 art.6の9の2(1)

Law id: 325CO0000000245 (地方税法施行令, Cabinet Order)
Revision: 325CO0000000245_20261101_508CO0000000083
Statutory article: art.6の9の2(1) — 地方税法15条の4(1)の政令で定める額 = 二千円
Normative unit: NORM|8f218ac0c48735c83d9984a2be0ad3731220bc855d1425dd950952af69cf7476

The implementation uses the equality predicate `amount = delegatedAmountYen`
(with `delegatedAmountYen = 2_000`). The independent spec reformulates it as
degenerate-interval membership `2_000 ≤ amount ∧ amount ≤ 2_000` — a distinct
formulation. The kernel proves equivalence for ALL amounts.

Boundary theorems (exactly ¥2,000 qualifies; ¥1,999 and ¥2,001 fail) are
universal where appropriate.

Not modelled: the substantive 地方税法 art.15-4(1), the conditions under which
the amount applies, other paragraphs, 省令 details.
-/

namespace JapanTaxLaw.LocalTaxOrderArt15_4Amount

open JapanTaxLaw.TaxFinance

/-- Independent spec: membership in the degenerate interval [2000, 2000]. -/
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

/-- Boundary: exactly ¥2,000 is the delegated amount. -/
theorem at_delegated : isDelegatedAmount delegatedAmountYen := by
  unfold isDelegatedAmount
  rfl

/-- Boundary: ¥1,999 is not the delegated amount. -/
theorem below_delegated : ¬ isDelegatedAmount 1_999 := by
  unfold isDelegatedAmount delegatedAmountYen
  decide

/-- Boundary: ¥2,001 is not the delegated amount. -/
theorem above_delegated : ¬ isDelegatedAmount 2_001 := by
  unfold isDelegatedAmount delegatedAmountYen
  decide

/-- The delegated amount is exactly ¥2,000 (二千円). -/
theorem amount_is_two_thousand : delegatedAmountYen = 2_000 := rfl

end JapanTaxLaw.LocalTaxOrderArt15_4Amount
