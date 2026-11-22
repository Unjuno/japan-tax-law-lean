import JapanTaxLaw.CustomsTariffArt8InvestigationDeadline

/-!
# CustomsTariffArt8InvestigationDeadlineSpec — independent spec for 関税定率法 第八条(34)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第八条(34) — the 前項 investigation must be completed 一年以内 from the
         date of a request under 第三十二項.
Normative unit: NORM|8e7f2e7760ab18115472d1df642a2e1050aed907df6e99450a2bfef59a875a11

The implementation defines `withinDeadline oneYearDays request completion :=
completion ≤ request + yearCount * oneYearDays` with yearCount = 1. The independent
spec restates the deadline as a CONTRAPOSITIVE strict-inequality: the completion is
within the deadline iff it is NOT the case that the deadline is strictly before
completion. This is representationally distinct (negated strict `<` vs. `≤`) and
equivalent for all Nat; proved axiom-free via Nat.not_lt_of_ge / Nat.le_of_not_gt.

Not modelled: investigation substance, the 第三十二項 request mechanism, calendar
conversion of 一年 into days, and legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt8InvestigationDeadline

/-- Independent spec: within deadline iff deadline not strictly before completion. -/
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

end JapanTaxLaw.CustomsTariffArt8InvestigationDeadline
