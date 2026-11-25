import JapanTaxLaw.BatchMultiRead14fd6c95c9Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead14fd6c95c9

example : sourcePhraseText0 = "（当該家屋が対象従前居住の用に供されていた家屋である場合には、特定事由により当該家屋が被相続人の居住の用に供されなくなる直前）において、" := by rfl
example : replacementPhraseText0 = "において" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead14fd6c95c9
