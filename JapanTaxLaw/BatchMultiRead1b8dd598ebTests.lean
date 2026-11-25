import JapanTaxLaw.BatchMultiRead1b8dd598ebSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead1b8dd598eb

example : sourcePhraseText0 = "特定口座内保管上場株式等" := by rfl
example : replacementPhraseText0 = "第十五項又は第十六項において準用する第十項に規定する相続上場株式等" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "前項第二号イ" := by rfl
example : replacementPhraseText1 = "第十七項において準用する前項第二号イ" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "特定口座内保管上場株式等" := by rfl
example : replacementPhraseText2 = "第十五項又は第十六項において準用する第十項に規定する相続上場株式等" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "前項第二号ロ" := by rfl
example : replacementPhraseText3 = "第十七項において準用する前項第二号ロ" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead1b8dd598eb
