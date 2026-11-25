import JapanTaxLaw.BatchMultiRead2ce259c16cSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead2ce259c16c

example : sourcePhraseText0 = "その満たさない" := by rfl
example : replacementPhraseText0 = "当該各号に掲げる場合に該当する" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "同項" := by rfl
example : replacementPhraseText1 = "第一項" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "第五項" := by rfl
example : replacementPhraseText2 = "第九項" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "特例適用申告書が同項" := by rfl
example : replacementPhraseText3 = "同項各号に定める申告書が第五項" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "当該特例適用申告書" := by rfl
example : replacementPhraseText4 = "当該各号に定める申告書" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "特例適用申告書を" := by rfl
example : replacementPhraseText5 = "次項各号に定める申告書を" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "当該特例適用申告書" := by rfl
example : replacementPhraseText6 = "当該各号に定める申告書" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead2ce259c16c
