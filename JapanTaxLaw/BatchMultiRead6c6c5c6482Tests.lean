import JapanTaxLaw.BatchMultiRead6c6c5c6482Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead6c6c5c6482

example : sourcePhraseText0 = "申告書に係る事業年度終了の日の翌日から四十五日以内" := by rfl
example : replacementPhraseText0 = "申告書の提出期限の到来する日の十五日前まで" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "申告書に係る事業年度終了の日の翌日から二月以内" := by rfl
example : replacementPhraseText1 = "申告書の提出期限まで" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "同項に" := by rfl
example : replacementPhraseText2 = "次条第八項において準用するこの項の規定による利子税のほか、第一項に" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "当該事業年度終了の日の翌日以後二月を経過した日から同項" := by rfl
example : replacementPhraseText3 = "同条第一項の規定により延長された当該申告書の提出期限の翌日から第一項" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead6c6c5c6482
