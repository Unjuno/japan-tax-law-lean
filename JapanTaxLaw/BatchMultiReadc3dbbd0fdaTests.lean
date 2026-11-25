import JapanTaxLaw.BatchMultiReadc3dbbd0fdaSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReadc3dbbd0fda

example : sourcePhraseText0 = "二百八十七分の二百四十三又は二百八十七分の四十四" := by rfl
example : replacementPhraseText0 = "三十六分の十六又は三十六分の二十" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "揮発油税又は地方揮発油税" := by rfl
example : replacementPhraseText1 = "とん税又は特別とん税" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReadc3dbbd0fda
