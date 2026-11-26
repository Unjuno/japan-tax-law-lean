import JapanTaxLaw.BatchMultiRead7f87c99f13Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead7f87c99f13

example : sourcePhraseText0 = "当該申請書" := by rfl
example : replacementPhraseText0 = "担保提供関係書類（第十八項の変更担保提供関係書類提出期限延長届出書に係るものに限る。）" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "前項の規定による通知を受けた日の翌日から起算して二十日以内にその変更に係る" := by rfl
example : replacementPhraseText1 = "第二十一項の規定により読み替えて適用する第二項の担保提供関係書類の提出期限までにその変更に係る当該" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead7f87c99f13
