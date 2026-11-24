import JapanTaxLaw.ReadingSubstitutionArt7

/-!
# Independent spec — art. 7 reading substitution

The spec states the same rewrite as an equality test against the quoted
phrase, while the implementation uses pattern matching. Agreement is proved
for every phrase in the declared domain by exhaustive cases.
-/
namespace JapanTaxLaw.ReadingSubstitutionArt7

def specReading (p : Phrase) : Phrase :=
  if p == Phrase.original then Phrase.replacement else p

theorem agree_spec_impl (p : Phrase) : specReading p = applyReading p := by
  cases p <;> rfl

end JapanTaxLaw.ReadingSubstitutionArt7
