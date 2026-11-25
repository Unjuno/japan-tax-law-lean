import JapanTaxLaw.BatchTableReadac3ca8153fSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableReadac3ca8153f

example : sourcePhraseText0 = "同項第一号ハ" := by rfl
example : replacementPhraseText0 = "法第三百十四条の二第七項第一号ハ" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "第三十四条第七項第一号イ" := by rfl
example : replacementPhraseText1 = "第三百十四条の二第七項第一号イ" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "第三十四条第七項第一号ロ" := by rfl
example : replacementPhraseText2 = "第三百十四条の二第七項第一号ロ" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "第三十四条第七項第一号ハ第三十四条第一項第五号ハ" := by rfl
example : replacementPhraseText3 = "第三百十四条の二第七項第一号ハ第三百十四条の二第一項第五号ハ" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "同項第四号イ" := by rfl
example : replacementPhraseText4 = "法第三百十四条の二第七項第四号イ" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableReadac3ca8153f
