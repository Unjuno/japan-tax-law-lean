import JapanTaxLaw.InheritanceRegPrescribedAmount

/-!
# InheritanceRegPrescribedAmountSpec — independent spec for 相続税法施行規則 art.30

Law id: 325M50000040017 (相続税法施行規則)
Revision: 325M50000040017_20260901_506M60000040016
Statutory article: art.30(3) — 法59条1項ただし書の財務省令で定める額 = 百万円
Normative unit: NORM|6b83a747a7e86cb520e53a9ba162dd0beda902d06616239281a19e2cb5460f75

The implementation states the delegated amount as the equality predicate
`amount = prescribedAmountYen` (with `prescribedAmountYen = 1_000_000`). The
independent spec reformulates it as interval membership: `amount ∈ [1M, 1M]`,
i.e. `1_000_000 ≤ amount ∧ amount ≤ 1_000_000`. These are distinct formulations;
the kernel proves equivalence for ALL amounts.

Boundary theorems (exactly ¥1M qualifies; ¥999,999 and ¥1,000,001 fail) are
universal where appropriate.

Not modelled: the substantive 相続税法 art.59(1) proviso, the conditions under
which the amount applies, other paragraphs, 政令 details.
-/

namespace JapanTaxLaw.InheritanceRegPrescribedAmount

open JapanTaxLaw.TaxFinance

/-- Independent spec: membership in the degenerate interval [1M, 1M]. -/
def specIsPrescribedAmount (amount : Money) : Prop :=
  prescribedAmountYen ≤ amount ∧ amount ≤ prescribedAmountYen

/-- Correspondence for all amounts. Universal, kernel-checked. -/
theorem agree_prescribed_amount (amount : Money) :
    isPrescribedAmount amount ↔ specIsPrescribedAmount amount := by
  unfold isPrescribedAmount specIsPrescribedAmount
  constructor
  · intro h
    subst amount
    exact ⟨Nat.le_refl _, Nat.le_refl _⟩
  · intro h
    exact Nat.le_antisymm h.2 h.1

/-- Boundary: exactly ¥1,000,000 is the prescribed amount. -/
theorem at_prescribed : isPrescribedAmount prescribedAmountYen := by
  unfold isPrescribedAmount
  rfl

/-- Boundary: ¥999,999 is not the prescribed amount. -/
theorem below_prescribed : ¬ isPrescribedAmount 999_999 := by
  unfold isPrescribedAmount prescribedAmountYen
  decide

/-- Boundary: ¥1,000,001 is not the prescribed amount. -/
theorem above_prescribed : ¬ isPrescribedAmount 1_000_001 := by
  unfold isPrescribedAmount prescribedAmountYen
  decide

/-- The prescribed amount is exactly ¥1,000,000 (百万円). -/
theorem amount_is_one_million : prescribedAmountYen = 1_000_000 := rfl

end JapanTaxLaw.InheritanceRegPrescribedAmount
