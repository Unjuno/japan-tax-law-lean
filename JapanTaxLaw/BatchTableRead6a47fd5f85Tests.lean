import JapanTaxLaw.BatchTableRead6a47fd5f85Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead6a47fd5f85

example : sourcePhraseText0 = "の各課税事業年度（以下第十二項までにおいて「対象課税事業年度」という。）において、過去適用課税事業年度（当該対象課税事業年度" := by rfl
example : replacementPhraseText0 = "が合併により解散した場合又は通算法人の残余財産が確定した場合において、その合併の日以後又はその残余財産の確定の日の翌日以後に、過去適用課税事業年度（最終課税事業年度（その合併の日の前日又はその残余財産の確定の日の属する課税事業年度をいう。以下この項及び次項において同じ。）" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "税額控除額（当該対象課税事業年度" := by rfl
example : replacementPhraseText1 = "税額控除額（当該最終課税事業年度" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "超える場合には" := by rfl
example : replacementPhraseText2 = "超えるときは" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "を当該対象課税事業年度" := by rfl
example : replacementPhraseText3 = "を当該最終課税事業年度" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "の対象課税事業年度において" := by rfl
example : replacementPhraseText4 = "が合併により解散した場合又は通算法人の残余財産が確定した場合において、その合併の日以後又はその残余財産の確定の日の翌日以後に" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "場合には、当該対象課税事業年度" := by rfl
example : replacementPhraseText5 = "ときは、最終課税事業年度" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead6a47fd5f85
