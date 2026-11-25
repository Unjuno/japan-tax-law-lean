import JapanTaxLaw.BatchMultiRead2a65fb7d22Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead2a65fb7d22

example : sourcePhraseText0 = "業務執行を行う者" := by rfl
example : replacementPhraseText0 = "非居住者" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "業務執行を行う者（法人に限る。）" := by rfl
example : replacementPhraseText1 = "外国法人" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "業務執行を行う者" := by rfl
example : replacementPhraseText2 = "一の非居住者又は外国法人（次号において「非居住者等" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "業務執行を行う者" := by rfl
example : replacementPhraseText3 = "一の非居住者等" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead2a65fb7d22
