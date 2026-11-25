import JapanTaxLaw.BatchRead6c1e206744Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchRead6c1e206744

example : sourcePhraseText = "前項ただし書の承認を受けた製造用原料品" := by rfl
example : replacementPhraseText = "当該貨物" := by rfl
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

end JapanTaxLaw.BatchRead6c1e206744
