import JapanTaxLaw.BatchMultiRead8ff22b6b25Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead8ff22b6b25

example : sourcePhraseText0 = "税務署の当該職員" := by rfl
example : replacementPhraseText0 = "税務署の当該職員（税関職員が最初に発見したときは、当該発見地又は当該犯則事件に係る国際観光旅客税の納税地を所轄する税関の税関職員）" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "国税局の当該職員" := by rfl
example : replacementPhraseText1 = "国税局の当該職員（税関職員が最初に発見したときは、当該発見地又は当該犯則事件に係る国際観光旅客税の納税地を所轄する税関の税関職員）" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead8ff22b6b25
