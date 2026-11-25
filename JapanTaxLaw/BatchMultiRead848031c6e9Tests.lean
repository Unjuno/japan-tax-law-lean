import JapanTaxLaw.BatchMultiRead848031c6e9Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead848031c6e9

example : sourcePhraseText0 = "当該輸出した" := by rfl
example : replacementPhraseText0 = "当該廃棄した" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "輸出" := by rfl
example : replacementPhraseText1 = "廃棄" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "前条第一項第一号に規定する書類に基づいて同号イからホまでに掲げる事項を記載した書類" := by rfl
example : replacementPhraseText2 = "当該製造たばこが税関長の承認を受けて廃棄された事実を証する書類" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead848031c6e9
