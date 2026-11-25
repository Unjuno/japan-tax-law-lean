import JapanTaxLaw.BatchMultiRead33d9096e33Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead33d9096e33

example : sourcePhraseText0 = "当該資産の取得又は改良に要した金額" := by rfl
example : replacementPhraseText0 = "税務署長の承認を受けた当該資産の取得又は改良に要する金額の見積額" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead33d9096e33
