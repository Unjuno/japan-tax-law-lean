import JapanTaxLaw.BatchMultiRead18d3af9383Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead18d3af9383

example : sourcePhraseText0 = "実質公債費比率が十・一パーセント未満" := by rfl
example : replacementPhraseText0 = "実質公債費比率が五・六パーセント未満" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "将来負担比率が百四十八・七パーセント未満" := by rfl
example : replacementPhraseText1 = "将来負担比率が六・三パーセント未満" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead18d3af9383
