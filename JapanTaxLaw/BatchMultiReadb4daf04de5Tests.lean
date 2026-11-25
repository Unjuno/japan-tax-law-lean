import JapanTaxLaw.BatchMultiReadb4daf04de5Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReadb4daf04de5

example : sourcePhraseText0 = "当該土地等に係る面積が" := by rfl
example : replacementPhraseText0 = "当該土地等に係る面積と次条第一項の特別勘定の基礎となつた譲渡に係る同条第七項又は第八項に規定する買換資産のうち土地等に係る面積との合計が" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReadb4daf04de5
