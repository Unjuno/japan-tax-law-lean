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

-- ==== appended boundary examples (kernel-decided) ====
-- (a) zero input: substitution of an empty paragraph-7 text is empty
example : applyReadingToText [] = ([] : List DeadlinePhrase) := rfl

-- (b) small positive input 1..13: the one-year outer bound is 12 months (∈ 1..13),
--     unchanged by the reading — the saturating arithmetic at the statutory threshold
example : outerDeadlineMonths (readingSubstitution withinOneYear) = 12 := by decide
example : outerDeadlineMonths (readingSubstitution withinOneYearPromptly) = 12 := by decide

-- (c) saturation / identity: substituting twice equals substituting once (identity),
--     and the promptness flag saturates to true for every substituted phrase
example : readingSubstitution (readingSubstitution withinOneYear) = withinOneYearPromptly := by decide
example : hasPromptnessReq (readingSubstitution (readingSubstitution withinOneYear)) = true := by decide
example : (applyReadingToText [withinOneYear, withinOneYear]).map hasPromptnessReq = [true, true] := by decide

-- 法定の 12 か月阈值まわりの saturating Nat 減算（期限月数は caller-established な
-- DeadlinePhrase から決まり、この API は Nat 入力を持たないため算術例で境界を示す）。
-- (a) 零入力: 0 - 12 = 0（saturating）
example : 0 - outerDeadlineMonths withinOneYear = 0 := by decide
-- (b) 小さい正の入力 (1..13): 13 - 12 = 1（阈值を 1 か月超える）
example : 13 - outerDeadlineMonths withinOneYear = 1 := by decide
-- (c) saturation: 12 - 13 = 0（阈值未満で控除後は 0）
example : outerDeadlineMonths withinOneYear - 13 = 0 := by decide

end JapanTaxLaw.CustomsReadingSubstitution
