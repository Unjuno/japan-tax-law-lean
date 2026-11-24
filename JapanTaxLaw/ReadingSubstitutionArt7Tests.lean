import JapanTaxLaw.ReadingSubstitutionArt7Spec

/-! Exhaustive boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.ReadingSubstitutionArt7

example : applyReading Phrase.original = Phrase.replacement := by rfl
example : applyReading Phrase.replacement = Phrase.replacement := by rfl
example : applyReading Phrase.other = Phrase.other := by rfl

example : sourcePhraseText = "一年以内に" := by rfl
example : replacementPhraseText = "一年以内において速やかに" := by rfl

example : specReading Phrase.original = applyReading Phrase.original := agree_spec_impl Phrase.original
example : specReading Phrase.replacement = applyReading Phrase.replacement := agree_spec_impl Phrase.replacement
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other

end JapanTaxLaw.ReadingSubstitutionArt7
