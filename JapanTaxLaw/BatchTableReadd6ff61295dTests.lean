import JapanTaxLaw.BatchTableReadd6ff61295dSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableReadd6ff61295d

example : sourcePhraseText0 = "第六十六条の八第五項の" := by rfl
example : replacementPhraseText0 = "第六十六条の八第十一項の規定により読み替えられた同条第五項の" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "同条第四項の" := by rfl
example : replacementPhraseText1 = "同条第十項の" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "同条第五項各号に定める課税済金額（同条第四項第二号に掲げる金額をいう。以下この条において同じ。）" := by rfl
example : replacementPhraseText2 = "同条第十一項の規定により読み替えられた同条第五項各号に定める間接配当等（同条第十項第一号に掲げる金額をいう。以下この項及び第六項において同じ。）又は間接課税済金額（同条第十項第二号ロに掲げる金額をいう。以下この項及び第六項において同じ。）" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "の課税済金額" := by rfl
example : replacementPhraseText3 = "の間接配当等又は間接課税済金額" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "同項第一号" := by rfl
example : replacementPhraseText4 = "同条第十一項の規定により読み替えられた同条第五項第一号" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "合併等前十年内事業年度" := by rfl
example : replacementPhraseText5 = "合併等前二年内事業年度" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "合併等前十年内事業年度" := by rfl
example : replacementPhraseText6 = "合併等前二年内事業年度" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "同号" := by rfl
example : replacementPhraseText7 = "同条第十一項の規定により読み替えられた同条第五項第二号" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "分割等前十年内事業年度" := by rfl
example : replacementPhraseText8 = "分割等前二年内事業年度" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "分割等前十年内事業年度" := by rfl
example : replacementPhraseText9 = "分割等前二年内事業年度" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "前十年以内" := by rfl
example : replacementPhraseText10 = "前二年以内" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "内国法人十年前事業年度開始日" := by rfl
example : replacementPhraseText11 = "内国法人二年前事業年度開始日" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "合併等前十年内事業年度又は分割等前十年内事業年度" := by rfl
example : replacementPhraseText12 = "合併等前二年内事業年度又は分割等前二年内事業年度" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "被合併法人等前十年内事業年度" := by rfl
example : replacementPhraseText13 = "被合併法人等前二年内事業年度" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : sourcePhraseText14 = "被合併法人等十年前事業年度開始日" := by rfl
example : replacementPhraseText14 = "被合併法人等二年前事業年度開始日" := by rfl
example : applyReading Phrase.original14 = Phrase.replacement14 := by rfl
example : specReading Phrase.original14 = applyReading Phrase.original14 := agree_spec_impl Phrase.original14
example : sourcePhraseText15 = "前項" := by rfl
example : replacementPhraseText15 = "第十三項の規定により読み替えられた前項" := by rfl
example : applyReading Phrase.original15 = Phrase.replacement15 := by rfl
example : specReading Phrase.original15 = applyReading Phrase.original15 := agree_spec_impl Phrase.original15
example : sourcePhraseText16 = "第六十六条の八第五項第二号" := by rfl
example : replacementPhraseText16 = "第六十六条の八第十一項の規定により読み替えられた同条第五項第二号" := by rfl
example : applyReading Phrase.original16 = Phrase.replacement16 := by rfl
example : specReading Phrase.original16 = applyReading Phrase.original16 := agree_spec_impl Phrase.original16
example : sourcePhraseText17 = "分割等前十年内事業年度の課税済金額" := by rfl
example : replacementPhraseText17 = "分割等前二年内事業年度の間接配当等又は間接課税済金額" := by rfl
example : applyReading Phrase.original17 = Phrase.replacement17 := by rfl
example : specReading Phrase.original17 = applyReading Phrase.original17 := agree_spec_impl Phrase.original17
example : sourcePhraseText18 = "請求権勘案直接保有株式等（内国法人が有する外国法人の株式等の数又は金額（当該外国法人が請求権の内容が異なる株式等を発行している場合には、当該外国法人の発行済株式等に、当該内国法人が当該請求権の内容が異なる株式等に係る請求権に基づき受けることができる剰余金の配当等の額がその総額のうちに占める割合を乗じて計算した数又は金額）をいう。以下この項及び第八項において同じ。）" := by rfl
example : replacementPhraseText18 = "間接保有の株式等の数（法第六十六条の八第十項第二号イに規定する間接保有の株式等の数をいう。以下この項において同じ。）" := by rfl
example : applyReading Phrase.original18 = Phrase.replacement18 := by rfl
example : specReading Phrase.original18 = applyReading Phrase.original18 := agree_spec_impl Phrase.original18
example : sourcePhraseText19 = "請求権勘案直接保有株式等の" := by rfl
example : replacementPhraseText19 = "間接保有の株式等の数の" := by rfl
example : applyReading Phrase.original19 = Phrase.replacement19 := by rfl
example : specReading Phrase.original19 = applyReading Phrase.original19 := agree_spec_impl Phrase.original19
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableReadd6ff61295d
