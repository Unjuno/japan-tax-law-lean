import JapanTaxLaw.CustomsTariffArt7InvestigationDeadline

/-!
# CustomsTariffArt7InvestigationDeadlineSpec — independent spec for 関税定率法 第七条(31)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第七条(31) — the 前項 investigation must be completed 一年以内 from the
         request date under 第二十九項.
Normative unit: NORM|a3c6d65dfb98b73b085f2ef4d01b3ef4243d2c0efc5bc55f46f6fac43405e0ea

The implementation defines `withinDeadline oneYearDays request completion :=
completion ≤ request + yearCount * oneYearDays`. The independent spec restates
the deadline as a CONTRAPOSITIVE strict-inequality: the completion is within the
deadline iff it is NOT the case that the deadline is strictly before completion.
This is representationally distinct (negated strict `<` vs. `≤`) and equivalent
for all inputs; kernel proves the equivalence axiom-free via Nat.not_lt_of_ge /
Nat.le_of_not_gt. Critically, it does NOT add a `completion ≥ request` constraint
that the implementation does not assert.

Not modelled: the investigation substance, the 第二十九項 request mechanism,
the calendar conversion of 一年 into days, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt7InvestigationDeadline

/-- Independent spec: within the deadline iff deadline is not strictly before completion. -/
def SpecWithinDeadline (oneYearDays request completion : Nat) : Prop :=
  ¬ (request + yearCount * oneYearDays < completion)

/-- Universal agreement. Axiom-free via Nat.not_lt_of_ge / Nat.le_of_not_gt. -/
theorem agree_within_deadline (oneYearDays request completion : Nat) :
    withinDeadline oneYearDays request completion ↔
      SpecWithinDeadline oneYearDays request completion := by
  unfold withinDeadline SpecWithinDeadline
  constructor
  · intro h
    exact Nat.not_lt_of_ge h
  · intro h
    exact Nat.le_of_not_gt h

end JapanTaxLaw.CustomsTariffArt7InvestigationDeadline
