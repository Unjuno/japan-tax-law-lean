import JapanTaxLaw.BatchMultiReadbd66f2033eSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReadbd66f2033e

example : sourcePhraseText0 = "非課税管理勘定" := by rfl
example : replacementPhraseText0 = "特定累積投資勘定" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "のものを除く" := by rfl
example : replacementPhraseText1 = "のもの（当該二以上の特定非課税管理勘定のみに係る同一銘柄のものを除く。）に限る" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "非課税管理勘定又は累積投資勘定" := by rfl
example : replacementPhraseText2 = "特定累積投資勘定" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "非課税管理勘定又は累積投資勘定" := by rfl
example : replacementPhraseText3 = "特定累積投資勘定" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "第九項" := by rfl
example : replacementPhraseText4 = "第二十五項第一号" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReadbd66f2033e
