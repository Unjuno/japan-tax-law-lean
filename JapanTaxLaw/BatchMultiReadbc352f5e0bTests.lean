import JapanTaxLaw.BatchMultiReadbc352f5e0bSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReadbc352f5e0b

example : sourcePhraseText0 = "合計輸入数量" := by rfl
example : replacementPhraseText0 = "合計輸入数量及び英国協定適用牛肉の輸入数量の合計数量" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "合計輸入数量" := by rfl
example : replacementPhraseText1 = "欧州連合協定適用牛肉の輸入数量" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "合計輸入数量" := by rfl
example : replacementPhraseText2 = "アメリカ合衆国協定第一輸入数量及びアメリカ合衆国協定第二輸入数量" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "合計輸入数量" := by rfl
example : replacementPhraseText3 = "欧州連合協定適用牛肉の輸入数量、英国協定適用牛肉の輸入数量及び環太平洋包括的及び先進的協定適用牛肉（英国を原産地とするものに限る。）の輸入数量の合計数量" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReadbc352f5e0b
