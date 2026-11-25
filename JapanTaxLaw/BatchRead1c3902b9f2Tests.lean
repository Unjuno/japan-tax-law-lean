import JapanTaxLaw.BatchRead1c3902b9f2Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchRead1c3902b9f2

example : sourcePhraseText = "同項の表の各号の第三欄に掲げる雇用者" := by rfl
example : replacementPhraseText = "次条第一項に規定する避難対象雇用者等" := by rfl
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

end JapanTaxLaw.BatchRead1c3902b9f2
