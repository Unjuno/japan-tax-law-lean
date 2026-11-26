import JapanTaxLaw.BatchMultiRead3d29273557Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead3d29273557

example : sourcePhraseText0 = "第二項第一号イ" := by rfl
example : replacementPhraseText0 = "第四項第一号イ" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "構成会社等の所在地国における" := by rfl
example : replacementPhraseText1 = "共同支配会社等及び当該共同支配会社等に係る当該所在地国を所在地国とする他の共同支配会社等の" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "係る当該特定多国籍企業グループ等の" := by rfl
example : replacementPhraseText2 = "係る" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "第六項から第九項までの規定" := by rfl
example : replacementPhraseText3 = "第六項から第八項までの規定" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "ついて第六項から第九項まで" := by rfl
example : replacementPhraseText4 = "ついて第十四項において準用する第六項から第八項まで" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "第二項第一号" := by rfl
example : replacementPhraseText5 = "第四項第一号" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "第二項第三号若しくは" := by rfl
example : replacementPhraseText6 = "第四項第三号若しくは" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead3d29273557
