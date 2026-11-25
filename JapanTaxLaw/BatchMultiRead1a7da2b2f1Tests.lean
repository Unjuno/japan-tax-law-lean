import JapanTaxLaw.BatchMultiRead1a7da2b2f1Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead1a7da2b2f1

example : sourcePhraseText0 = "第一項各号に掲げる帳簿書類の" := by rfl
example : replacementPhraseText0 = "次条第一項に規定する特定事項記載書類の" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "第一項各号に掲げる帳簿書類" := by rfl
example : replacementPhraseText1 = "次条第一項に規定する特定事項記載書類" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead1a7da2b2f1
