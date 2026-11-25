import JapanTaxLaw.BatchTableRead6e846f58a1Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead6e846f58a1

example : sourcePhraseText0 = "旧令" := by rfl
example : replacementPhraseText0 = "旧令第四十二条の十第三項において準用する旧令" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "算定額" := by rfl
example : replacementPhraseText1 = "第十項に規定する指定市算定額（次項及び第九項において「指定市算定額」という。）" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "第五項本文" := by rfl
example : replacementPhraseText2 = "第十項本文" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "都道府県が各市町村に交付すべき額を計算する場合又は第六項第一号の規定を適用して各市町村が都道府県に返還すべき額" := by rfl
example : replacementPhraseText3 = "指定市算定額" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "第五項本文" := by rfl
example : replacementPhraseText4 = "次項本文" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "各市町村に交付すべき額" := by rfl
example : replacementPhraseText5 = "同項に規定する指定市（以下この項において「指定市」という。）に指定市算定額" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "第六項第一号" := by rfl
example : replacementPhraseText6 = "第十一項第一号" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "各市町村に返還すべき額" := by rfl
example : replacementPhraseText7 = "指定市に次項ただし書に規定する指定市超過交付額" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "算定額" := by rfl
example : replacementPhraseText8 = "指定市算定額" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead6e846f58a1
