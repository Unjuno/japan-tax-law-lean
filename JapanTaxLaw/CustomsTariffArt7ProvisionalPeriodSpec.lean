import JapanTaxLaw.CustomsTariffArt7ProvisionalPeriod

/-!
# CustomsTariffArt7ProvisionalPeriodSpec — independent spec for 関税定率法 第七条(3)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第七条(3) Item 3 — the period from 九十日前の日以後 (on or after the day 90
         days before the provisional measure) through 指定がされた日の前日まで
         (through the day before the 第一項 designation).
Normative unit: NORM|bc9ece29b2b61de2536a557c4d241b619e5f147f15451aad8242eaea7e175af5

The implementation defines `inPeriod lo hi t := lo ≤ t ∧ t ≤ hi` (two inclusive
`≤` bounds). The independent spec restates interval membership in a
representationally distinct form: NOT strictly before the lower bound AND NOT
strictly after the upper bound, i.e. `¬(t < lo) ∧ ¬(hi < t)`. This is equivalent
for all Nat inputs and is proved axiom-free via `Nat.not_lt_of_ge` /
`Nat.le_of_not_gt`. Critically, it adds no extra constraint (it does not require
`lo ≤ hi` internally; well-formedness is an explicit separate precondition of
the implementation's theorems, not something the spec smuggles in).

Not modelled: the provisional measure, the 第一項 designation, calendar day
arithmetic (months/leap years), underflow, and legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt7ProvisionalPeriod

/-- Independent spec: inside the period iff not before lo and not after hi. -/
def SpecInPeriod (lo hi t : Nat) : Prop :=
  ¬ (t < lo) ∧ ¬ (hi < t)

/-- Universal agreement between implementation and independent spec.
    Axiom-free via Nat.not_lt_of_ge / Nat.le_of_not_gt. -/
theorem agree_in_period (lo hi t : Nat) :
    inPeriod lo hi t ↔ SpecInPeriod lo hi t := by
  unfold inPeriod SpecInPeriod
  constructor
  · intro h
    exact ⟨Nat.not_lt_of_ge h.1, Nat.not_lt_of_ge h.2⟩
  · intro h
    exact ⟨Nat.le_of_not_gt h.1, Nat.le_of_not_gt h.2⟩

end JapanTaxLaw.CustomsTariffArt7ProvisionalPeriod
