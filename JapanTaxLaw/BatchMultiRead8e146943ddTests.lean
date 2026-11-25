import JapanTaxLaw.BatchMultiRead8e146943ddSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead8e146943dd

example : sourcePhraseText0 = "当該申請に係るバイオエタノール等揮発油の製造場" := by rfl
example : replacementPhraseText0 = "当該バイオエタノール等の貯蔵場所" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "揮発油に混和する年月日" := by rfl
example : replacementPhraseText1 = "移出する年月日並びに受取人の住所及び氏名又は名称" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead8e146943dd
