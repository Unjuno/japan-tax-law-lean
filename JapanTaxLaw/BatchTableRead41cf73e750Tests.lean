import JapanTaxLaw.BatchTableRead41cf73e750Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead41cf73e750

example : sourcePhraseText0 = "内国法人が適格合併" := by rfl
example : replacementPhraseText0 = "第六十六条の九の二第二項第二号に規定する特殊関係内国法人（以下この項において「特殊関係内国法人」という。）に係る同条第一項に規定する特殊関係株主等（以下この項において「特殊関係株主等」という。）である内国法人が適格合併" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "により被合併法人" := by rfl
example : replacementPhraseText1 = "により当該特殊関係内国法人に係る特殊関係株主等である被合併法人" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "前項" := by rfl
example : replacementPhraseText2 = "第六十六条の九の四第四項" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "課税済金額とみなす" := by rfl
example : replacementPhraseText3 = "課税済金額（同項第二号に掲げる金額をいう。以下この項、次項及び第十二項において同じ。）とみなす" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "第六十六条の六第一項" := by rfl
example : replacementPhraseText4 = "第六十六条の九の二第一項" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "が前項" := by rfl
example : replacementPhraseText5 = "が第六十六条の九の四第五項において準用する前項" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "第四項" := by rfl
example : replacementPhraseText6 = "同条第四項" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "、前項" := by rfl
example : replacementPhraseText7 = "、同条第五項において準用する前項" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "第一項から第三項まで及び第七項から第九項まで" := by rfl
example : replacementPhraseText8 = "第六十六条の九の四第一項から第三項まで" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead41cf73e750
