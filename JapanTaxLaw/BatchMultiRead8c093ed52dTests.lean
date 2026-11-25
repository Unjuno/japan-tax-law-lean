import JapanTaxLaw.BatchMultiRead8c093ed52dSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead8c093ed52d

example : sourcePhraseText0 = "輸出申告若しくは輸入申告に係る" := by rfl
example : replacementPhraseText0 = "輸入の許可を受けた" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "若しくは売渡人" := by rfl
example : replacementPhraseText1 = "又は売渡人" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "が輸出申告若しくは輸入申告の内容を確認するために必要な書類又は" := by rfl
example : replacementPhraseText2 = "に対して当該貨物に係る輸入の許可に関する申告の内容を明らかにすることができる書類及び" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead8c093ed52d
