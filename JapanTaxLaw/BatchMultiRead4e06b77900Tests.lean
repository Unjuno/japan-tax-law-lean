import JapanTaxLaw.BatchMultiRead4e06b77900Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead4e06b77900

example : sourcePhraseText0 = "当該開始の時" := by rfl
example : replacementPhraseText0 = "次項に規定する適格組織再編成の時" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "当該最初に開始する事業年度の前事業年度までの" := by rfl
example : replacementPhraseText1 = "当該適格組織再編成に係る同条第三項に規定する被合併法人等の" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead4e06b77900
