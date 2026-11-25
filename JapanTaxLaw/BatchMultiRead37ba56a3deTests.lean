import JapanTaxLaw.BatchMultiRead37ba56a3deSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead37ba56a3de

example : sourcePhraseText0 = "買換資産（政令で定めるところにより納税地の所轄税務署長にこの項の規定の適用を受ける旨の届出をした場合における当該買換資産に限る。）" := by rfl
example : replacementPhraseText0 = "買換資産" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "当該事業年度の確定した決算" := by rfl
example : replacementPhraseText1 = "当該買換資産の取得をした日を含む事業年度の確定した決算" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead37ba56a3de
