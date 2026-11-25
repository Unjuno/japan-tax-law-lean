import JapanTaxLaw.BatchMultiRead70c5a507a6Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead70c5a507a6

example : sourcePhraseText0 = "従前の土地のうちの被災住宅用地に相当する土地" := by rfl
example : replacementPhraseText0 = "従前の土地のうちの特定被災住宅用地に相当する土地" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "次条第三項" := by rfl
example : replacementPhraseText1 = "次条第四項において準用する同条第三項" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead70c5a507a6
