import JapanTaxLaw.InvestigationDeadlineOneYear

/-!
# Independent spec — art. 7(7) one-year investigation deadline

The spec restates 「一年以内」 as the negation of the strict excess test.
Agreement is universal over all elapsed whole-year counts.
-/
namespace JapanTaxLaw.InvestigationDeadlineOneYear

def specWithin (elapsedYears : Nat) : Bool :=
  !decide (limitYears < elapsedYears)

theorem agree_spec_impl (elapsedYears : Nat) : specWithin elapsedYears = withinDeadline elapsedYears := by
  unfold specWithin withinDeadline
  by_cases h : elapsedYears <= limitYears
  · have hn : ¬ limitYears < elapsedYears := Nat.not_lt.mpr h
    simp [h, hn]
  · have hle : limitYears < elapsedYears := Nat.lt_of_not_ge h
    simp [h, hle]

end JapanTaxLaw.InvestigationDeadlineOneYear
