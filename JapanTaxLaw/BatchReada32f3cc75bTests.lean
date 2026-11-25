import JapanTaxLaw.BatchReada32f3cc75bSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchReada32f3cc75b

example : sourcePhraseText = "当該事業年度の確定した決算" := by rfl
example : replacementPhraseText = "当該代替資産の取得の日を含む事業年度の確定した決算" := by rfl
example : applyReading Phrase.original = Phrase.replacement := by rfl
example : applyReading Phrase.replacement = Phrase.replacement := by rfl
example : applyReading Phrase.other = Phrase.other := by rfl
example : applyWhen false Phrase.original = Phrase.original := by rfl
example : applyWhen false Phrase.replacement = Phrase.replacement := by rfl
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

example : specReading Phrase.original = applyReading Phrase.original := agree_spec_impl Phrase.original
example : specReading Phrase.replacement = applyReading Phrase.replacement := agree_spec_impl Phrase.replacement
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : specWhen true Phrase.original = applyWhen true Phrase.original := agree_when_spec_impl true Phrase.original
example : specWhen false Phrase.original = applyWhen false Phrase.original := agree_when_spec_impl false Phrase.original

end JapanTaxLaw.BatchReada32f3cc75b
