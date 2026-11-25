import JapanTaxLaw.BatchMultiRead00c191e735Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead00c191e735

example : sourcePhraseText0 = "第二項第一号イ" := by rfl
example : replacementPhraseText0 = "第五項第一号イ" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "我が国における" := by rfl
example : replacementPhraseText1 = "当該共同支配会社等及び当該共同支配会社等に係る他の共同支配会社等（その所在地国が我が国であるものに限る。）の" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "係る当該特定多国籍企業グループ等の" := by rfl
example : replacementPhraseText2 = "係る" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "第八項及び第九項" := by rfl
example : replacementPhraseText3 = "第八項" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "これらの規定" := by rfl
example : replacementPhraseText4 = "同項" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "第一項第一号" := by rfl
example : replacementPhraseText5 = "第一項第二号" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "第八項又は第九項" := by rfl
example : replacementPhraseText6 = "第十五項において準用する第八項" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "第二項第一号" := by rfl
example : replacementPhraseText7 = "第五項第一号" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "第二項第三号" := by rfl
example : replacementPhraseText8 = "第五項第三号" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "第一項第一号" := by rfl
example : replacementPhraseText9 = "第一項第二号" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead00c191e735
