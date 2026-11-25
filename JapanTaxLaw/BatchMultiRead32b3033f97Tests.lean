import JapanTaxLaw.BatchMultiRead32b3033f97Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead32b3033f97

example : sourcePhraseText0 = "各年の国内消費量" := by rfl
example : replacementPhraseText0 = "各年の国内消費量（経済連携協定原産品に係る輸入数量及び締約国産物品に係る輸入数量を合計した数量に相当する数量を除く。以下この項及び次項において同じ。）" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead32b3033f97
