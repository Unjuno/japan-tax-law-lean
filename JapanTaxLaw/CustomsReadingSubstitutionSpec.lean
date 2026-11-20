import JapanTaxLaw.CustomsReadingSubstitution

/-!
# CustomsReadingSubstitutionSpec — independent spec for 関税定率法 art.7(15) 読替え

Law id: 143AC0000000054
Revision: 143AC0000000054_20260601_508AC0000000005
Statutory article: art. 7(15) sentence 2 (「一年以内に」→「一年以内において速やかに」読替え)
Normative unit: NORM|fc34952b4102c0a6697423e84c629c0eea802fb72c83594cac7374694c7ac66f

The implementation defines the reading rule by direct pattern matching on
`DeadlinePhrase`. The independent spec reformulates it as a predicate-based
conditional (`isOriginal` → substituted), a genuinely different formulation.
The kernel proves equivalence for BOTH inhabitants of the finite domain by
exhaustive case analysis (a universal proof over the type, not a sample).

Properties established for all phrases / arbitrary texts:
- the outer one-year deadline is preserved by the substitution;
- the substituted phrase adds the promptness requirement;
- the rule is idempotent;
- applying it across a paragraph-7 text preserves length and every deadline.

Not modelled: the triggering condition, substantive art.7 investigation rules,
other paragraphs and 政令 details.
-/

namespace JapanTaxLaw.CustomsReadingSubstitution

open DeadlinePhrase

/-- Independent spec: predicate-based conditional (different from pattern match). -/
def isOriginal (p : DeadlinePhrase) : Bool :=
  match p with
  | withinOneYear => true
  | withinOneYearPromptly => false

def specReading (p : DeadlinePhrase) : DeadlinePhrase :=
  if isOriginal p then withinOneYearPromptly else p

/-- Correspondence for all inhabitants of the (finite, exhaustive) type. -/
theorem agree_reading (p : DeadlinePhrase) :
    readingSubstitution p = specReading p := by
  cases p <;> rfl

/-- The outer one-year deadline is unchanged by the reading substitution. -/
theorem reading_preserves_deadline (p : DeadlinePhrase) :
    outerDeadlineMonths (readingSubstitution p) = outerDeadlineMonths p := by
  cases p <;> rfl

/-- The substituted phrase carries the promptness requirement. -/
theorem reading_adds_promptness :
    hasPromptnessReq (readingSubstitution withinOneYear) = true := by rfl

/-- The rule is idempotent: substituting twice equals substituting once. -/
theorem reading_idempotent (p : DeadlinePhrase) :
    readingSubstitution (readingSubstitution p) = readingSubstitution p := by
  cases p <;> rfl

/-- Applying the reading across a text preserves its length (universal over List). -/
theorem reading_text_preserves_length (text : List DeadlinePhrase) :
    (applyReadingToText text).length = text.length := by
  simp [applyReadingToText]

/-- Applying the reading across a text preserves every phrase's outer deadline
    (universal over arbitrary lists). -/
theorem reading_text_preserves_deadline (text : List DeadlinePhrase) :
    (applyReadingToText text).map outerDeadlineMonths =
      text.map outerDeadlineMonths := by
  induction text with
  | nil => rfl
  | cons p ps ih =>
      simp [applyReadingToText, reading_preserves_deadline]

/-- Finite smoke check only; `agree_reading` is the universal proof over the type. -/
def checkReading : Bool :=
  readingSubstitution withinOneYear == withinOneYearPromptly &&
  readingSubstitution withinOneYearPromptly == withinOneYearPromptly

example : checkReading = true := by decide

end JapanTaxLaw.CustomsReadingSubstitution
