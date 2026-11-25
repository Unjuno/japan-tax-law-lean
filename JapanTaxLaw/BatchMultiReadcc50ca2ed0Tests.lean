import JapanTaxLaw.BatchMultiReadcc50ca2ed0Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReadcc50ca2ed0

example : sourcePhraseText0 = "同項各号に掲げる外国関係法人" := by rfl
example : replacementPhraseText0 = "同条第十四項第一号に規定する添付不要部分対象外国関係法人" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "添付対象外国関係法人" := by rfl
example : replacementPhraseText1 = "添付不要部分対象外国関係法人" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReadcc50ca2ed0
