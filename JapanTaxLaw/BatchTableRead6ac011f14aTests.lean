import JapanTaxLaw.BatchTableRead6ac011f14aSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead6ac011f14a

example : sourcePhraseText0 = "第三十四条第七項第一号イ" := by rfl
example : replacementPhraseText0 = "第三百十四条の二第七項第一号イ" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "第三十四条第七項第一号ハ" := by rfl
example : replacementPhraseText1 = "第三百十四条の二第七項第一号ハ" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "第三十四条第七項第二号ニ" := by rfl
example : replacementPhraseText2 = "第三百十四条の二第七項第二号ニ" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "同条第七項第一号" := by rfl
example : replacementPhraseText3 = "法第三百十四条の二第七項第一号" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "同条第七項第三号" := by rfl
example : replacementPhraseText4 = "法第三百十四条の二第七項第三号" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "同条第七項第四号" := by rfl
example : replacementPhraseText5 = "法第三百十四条の二第七項第四号" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "第三十四条第一項第五号ロ" := by rfl
example : replacementPhraseText6 = "第三百十四条の二第一項第五号ロ" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "第三十四条第七項第三号" := by rfl
example : replacementPhraseText7 = "第三百十四条の二第七項第三号" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "第三十四条第七項第一号イ" := by rfl
example : replacementPhraseText8 = "第三百十四条の二第七項第一号イ" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "第三十四条第七項第一号ハ" := by rfl
example : replacementPhraseText9 = "第三百十四条の二第七項第一号ハ" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "第三十四条第一項第五号の三" := by rfl
example : replacementPhraseText10 = "第三百十四条の二第一項第五号の三" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead6ac011f14a
