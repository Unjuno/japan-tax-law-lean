import JapanTaxLaw.CustomsReadingSubstitutionSpec

/-!
# CustomsReadingSubstitutionTests — kernel-decided checks for art.7(15) 読替え

All checks are `rfl` / `by decide`, kernel-checked.
-/

namespace JapanTaxLaw.CustomsReadingSubstitution

open DeadlinePhrase

example : readingSubstitution withinOneYear = withinOneYearPromptly := rfl
example : readingSubstitution withinOneYearPromptly = withinOneYearPromptly := rfl
example : outerDeadlineMonths withinOneYear = 12 := rfl
example : outerDeadlineMonths withinOneYearPromptly = 12 := rfl
example : hasPromptnessReq withinOneYear = false := rfl
example : hasPromptnessReq withinOneYearPromptly = true := rfl

example : readingSubstitution withinOneYear = specReading withinOneYear :=
  agree_reading withinOneYear
example : outerDeadlineMonths (readingSubstitution withinOneYear) =
    outerDeadlineMonths withinOneYear :=
  reading_preserves_deadline withinOneYear
example : outerDeadlineMonths (readingSubstitution withinOneYearPromptly) =
    outerDeadlineMonths withinOneYearPromptly :=
  reading_preserves_deadline withinOneYearPromptly
example : hasPromptnessReq (readingSubstitution withinOneYear) = true :=
  reading_adds_promptness
example : readingSubstitution (readingSubstitution withinOneYear) =
    readingSubstitution withinOneYear :=
  reading_idempotent withinOneYear
example : checkReading = true := by decide

example : (applyReadingToText [withinOneYear, withinOneYearPromptly]).map outerDeadlineMonths =
    [withinOneYear, withinOneYearPromptly].map outerDeadlineMonths := by
  exact reading_text_preserves_deadline [withinOneYear, withinOneYearPromptly]

end JapanTaxLaw.CustomsReadingSubstitution
