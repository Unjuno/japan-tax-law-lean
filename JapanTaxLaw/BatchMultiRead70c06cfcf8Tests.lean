import JapanTaxLaw.BatchMultiRead70c06cfcf8Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead70c06cfcf8

example : sourcePhraseText0 = "農業の用に供する" := by rfl
example : replacementPhraseText0 = "農業の用に供し、又は当該農地等について第二十二項の規定により同項に規定する営農困難時貸付けを行う" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "地上権等の設定" := by rfl
example : replacementPhraseText1 = "第二十二項に規定する営農困難時貸付けに係る地上権、永小作権、使用貸借による権利又は賃借権の消滅及び地上権等の設定" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "場合" := by rfl
example : replacementPhraseText2 = "場合又は第二十二項の規定により同項に規定する営農困難時貸付けを行つていない場合" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "供していない部分" := by rfl
example : replacementPhraseText3 = "供している部分及び当該営農困難時貸付けを行つている部分以外の部分" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead70c06cfcf8
