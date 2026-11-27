import JapanTaxLaw.CustomsTariffArt7InvestigationStartDeadline

/-
Independent spec for CustomsTariffArt7InvestigationStartDeadline (関税定率法
第七条(7)). Own constants only: specYearCount = 1 (一年 from the verbatim
needle), specWithin (oneYearDays start completion) = completion ≤ start +
specYearCount * oneYearDays (以内 is inclusive).

No implementation identifiers occur in the spec definitions. Agreement is
established only by the separate unfold + rfl bridge theorems below, so the
spec is not a copy of the implementation.
-/

open JapanTaxLaw.CustomsTariffArt7InvestigationStartDeadline

namespace JapanTaxLaw.CustomsTariffArt7InvestigationStartDeadlineSpec

/-- Independent one-year count, derived from 一年 in the pinned needle. -/
def specYearCount : Nat := 1

/-- Independent inclusive deadline comparison from the investigation start. -/
def specWithin (oneYearDays start completion : Nat) : Prop :=
  completion ≤ start + specYearCount * oneYearDays

theorem agreeYearCount : yearCount = specYearCount := by
  unfold yearCount specYearCount
  rfl

theorem agreeWithin (oneYearDays start completion : Nat) :
    withinDeadline oneYearDays start completion = specWithin oneYearDays start completion := by
  unfold withinDeadline specWithin
  rw [agreeYearCount]

/-- Independent remaining-budget computation: days left inside the deadline,
    zero once it has passed. Written without implementation identifiers. -/
def specDaysRemaining (oneYearDays start completion : Nat) : Nat :=
  if completion ≤ start + oneYearDays then (start + oneYearDays) - completion else 0

theorem agreeDaysRemaining (oneYearDays start completion : Nat) :
    daysRemaining oneYearDays start completion = specDaysRemaining oneYearDays start completion := by
  unfold daysRemaining withinDeadlineBool specDaysRemaining yearCount
  rw [Nat.one_mul]
  simp

theorem spec_at_deadline (oneYearDays start : Nat) :
    specWithin oneYearDays start (start + specYearCount * oneYearDays) := by
  unfold specWithin
  exact Nat.le_refl _

end JapanTaxLaw.CustomsTariffArt7InvestigationStartDeadlineSpec
