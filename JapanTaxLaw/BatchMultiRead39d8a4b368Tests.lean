import JapanTaxLaw.BatchMultiRead39d8a4b368Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead39d8a4b368

example : sourcePhraseText0 = "二百八十七分の二百四十三又は二百八十七分の四十四" := by rfl
example : replacementPhraseText0 = "百二・一分の百又は百二・一分の二・一" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "揮発油税又は地方揮発油税" := by rfl
example : replacementPhraseText1 = "所得税又は復興特別所得税" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead39d8a4b368
