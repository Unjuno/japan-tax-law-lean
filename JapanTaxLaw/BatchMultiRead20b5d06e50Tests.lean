import JapanTaxLaw.BatchMultiRead20b5d06e50Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead20b5d06e50

example : sourcePhraseText0 = "非課税口座開設届出書並びに当該金融商品取引業者等に既に非課税口座を開設している居住者又は恒久的施設を有する非居住者から重ねて提出がされた非課税口座開設届出書" := by rfl
example : replacementPhraseText0 = "帰国届出書" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead20b5d06e50
