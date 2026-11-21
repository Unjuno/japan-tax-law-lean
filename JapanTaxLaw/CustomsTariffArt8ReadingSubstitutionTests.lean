import JapanTaxLaw.CustomsTariffArt8ReadingSubstitutionSpec

/-!
# CustomsTariffArt8ReadingSubstitutionTests — kernel-checked checks for 関税定率法 第八条(14)

Verifies the single-phrase reading substitution. All statutory CJK used here
comes from the injected `oldPhrase` / `newPhrase` constants — no hand-typed
statutory strings. The substitution replaces the old phrase with the new one,
leaves other text unchanged, and the two phrases are distinct.
-/

namespace JapanTaxLaw.CustomsTariffArt8ReadingSubstitution

-- The old phrase itself is replaced by the new reading.
example : readAs oldPhrase = newPhrase := rfl

-- A non-matching phrase is left unchanged (use the new phrase, which differs).
example : readAs newPhrase = newPhrase := by
  unfold readAs
  simp

-- The two phrases are distinct (substitution is non-trivial).
example : oldPhrase ≠ newPhrase := phrases_distinct

-- Universal agreement with the independent propositional spec.
example (text : String) : SpecReadAs text (readAs text) := agree_read_as text

end JapanTaxLaw.CustomsTariffArt8ReadingSubstitution
