import JapanTaxLaw.BatchMultiRead78e74d05c3Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead78e74d05c3

example : sourcePhraseText0 = "被災共用土地に係る被災区分所有家屋" := by rfl
example : replacementPhraseText0 = "特定仮換地等に対応する従前の土地である被災共用土地に係る被災区分所有家屋" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "被災共用土地納税義務者" := by rfl
example : replacementPhraseText1 = "特定仮換地等納税義務者" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "被災共用土地に係る持分の割合" := by rfl
example : replacementPhraseText2 = "特定仮換地等に対応する従前の土地である被災共用土地に係る持分の割合" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "第一項（前項において準用する場合を含む。）" := by rfl
example : replacementPhraseText3 = "第六項（第七項において準用する場合を含む。）の規定により読み替えて適用される第一項" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead78e74d05c3
