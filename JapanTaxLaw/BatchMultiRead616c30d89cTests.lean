import JapanTaxLaw.BatchMultiRead616c30d89cSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead616c30d89c

example : sourcePhraseText0 = "当該市が新たに指定都市等となつた日" := by rfl
example : replacementPhraseText0 = "指定都市等でない市町村の区域の全部又は一部が新たに指定都市等の区域に属することとなつた日" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "その所在する市が新たに指定都市等となつた日" := by rfl
example : replacementPhraseText1 = "その所在する指定都市等でない市町村の区域の全部又は一部が新たに指定都市等の区域に属することとなつた日" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead616c30d89c
