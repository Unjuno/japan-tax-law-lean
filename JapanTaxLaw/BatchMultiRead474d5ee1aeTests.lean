import JapanTaxLaw.BatchMultiRead474d5ee1aeSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead474d5ee1ae

example : sourcePhraseText0 = "当該土地等に係る面積が" := by rfl
example : replacementPhraseText0 = "当該土地等に係る面積と次条第一項の特別勘定の基礎となった譲渡に係る同条第八項又は第九項に規定する買換資産のうち土地等に係る面積との合計が" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead474d5ee1ae
