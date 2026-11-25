import JapanTaxLaw.BatchMultiReadf9372b9e79Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReadf9372b9e79

example : sourcePhraseText0 = "国税の控除余裕額及び地方税の控除余裕額は" := by rfl
example : replacementPhraseText0 = "第七項に規定する控除限度超過額は" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "国税の控除余裕額及び地方税の控除余裕額に" := by rfl
example : replacementPhraseText1 = "控除限度超過額に" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReadf9372b9e79
