import JapanTaxLaw.BatchTableReade5f40fcb32Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableReade5f40fcb32

example : sourcePhraseText0 = "内国法人が適格合併" := by rfl
example : replacementPhraseText0 = "第六十六条の九の二第二項第二号に規定する特殊関係内国法人（以下この項において「特殊関係内国法人」という。）に係る同条第一項に規定する特殊関係株主等（以下この項において「特殊関係株主等」という。）である内国法人が適格合併" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "により被合併法人" := by rfl
example : replacementPhraseText1 = "により当該特殊関係内国法人に係る特殊関係株主等である被合併法人" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "直接保有の株式等の数の" := by rfl
example : replacementPhraseText2 = "第十項第二号イに規定する間接保有の株式等の数（以下この項において「間接保有の株式等の数」という。）の" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "前項" := by rfl
example : replacementPhraseText3 = "第六十六条の九の四第九項" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "前十年以内の各事業年度の課税済金額" := by rfl
example : replacementPhraseText4 = "前二年以内の各事業年度（同項第一号に規定する前二年以内の各事業年度をいう。次項において同じ。）の間接配当等（同条第九項第一号に掲げる金額をいう。以下この項、次項及び第十二項において同じ。）又は間接課税済金額（同条第九項第二号ロに掲げる金額をいう。以下この項、次項及び第十二項において同じ。）" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "合併等前十年内事業年度前十年以内" := by rfl
example : replacementPhraseText5 = "合併等前二年内事業年度前二年以内" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "課税済金額" := by rfl
example : replacementPhraseText6 = "間接配当等又は間接課税済金額" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "分割等前十年内事業年度前十年以内" := by rfl
example : replacementPhraseText7 = "分割等前二年内事業年度前二年以内" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "課税済金額" := by rfl
example : replacementPhraseText8 = "間接配当等又は間接課税済金額" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "直接保有の株式等の数" := by rfl
example : replacementPhraseText9 = "間接保有の株式等の数" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "第六十六条の六第一項" := by rfl
example : replacementPhraseText10 = "第六十六条の九の二第一項" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "が前項" := by rfl
example : replacementPhraseText11 = "が第六十六条の九の四第十項において準用する前項" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "第四項" := by rfl
example : replacementPhraseText12 = "同条第九項" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "分割等前十年内事業年度の課税済金額" := by rfl
example : replacementPhraseText13 = "分割等前二年内事業年度の間接配当等又は間接課税済金額" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : sourcePhraseText14 = "、前項" := by rfl
example : replacementPhraseText14 = "、同条第十項において準用する前項" := by rfl
example : applyReading Phrase.original14 = Phrase.replacement14 := by rfl
example : specReading Phrase.original14 = applyReading Phrase.original14 := agree_spec_impl Phrase.original14
example : sourcePhraseText15 = "前十年以内の各事業年度の課税済金額" := by rfl
example : replacementPhraseText15 = "前二年以内の各事業年度の間接配当等又は間接課税済金額" := by rfl
example : applyReading Phrase.original15 = Phrase.replacement15 := by rfl
example : specReading Phrase.original15 = applyReading Phrase.original15 := agree_spec_impl Phrase.original15
example : sourcePhraseText16 = "第一項から第三項まで及び第七項から第九項まで" := by rfl
example : replacementPhraseText16 = "第六十六条の九の四第六項から第八項まで" := by rfl
example : applyReading Phrase.original16 = Phrase.replacement16 := by rfl
example : specReading Phrase.original16 = applyReading Phrase.original16 := agree_spec_impl Phrase.original16
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableReade5f40fcb32
