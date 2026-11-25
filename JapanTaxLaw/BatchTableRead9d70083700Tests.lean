import JapanTaxLaw.BatchTableRead9d70083700Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead9d70083700

example : sourcePhraseText0 = "直接保有の株式等の数の" := by rfl
example : replacementPhraseText0 = "第十項第二号イに規定する間接保有の株式等の数（以下この項において「間接保有の株式等の数」という。）の" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "前項" := by rfl
example : replacementPhraseText1 = "第十項" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "前十年以内の各事業年度の課税済金額" := by rfl
example : replacementPhraseText2 = "前二年以内の各事業年度（同項第一号に規定する前二年以内の各事業年度をいう。次項において同じ。）の間接配当等（第十項第一号に規定する間接配当等をいう。以下この項及び次項において同じ。）又は間接課税済金額（第十項第二号ロに規定する間接課税済金額をいう。以下この項及び次項において同じ。）" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "合併等前十年内事業年度" := by rfl
example : replacementPhraseText3 = "合併等前二年内事業年度" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "前十年以内" := by rfl
example : replacementPhraseText4 = "前二年以内" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "課税済金額" := by rfl
example : replacementPhraseText5 = "間接配当等又は間接課税済金額" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "分割等前十年内事業年度" := by rfl
example : replacementPhraseText6 = "分割等前二年内事業年度" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "前十年以内" := by rfl
example : replacementPhraseText7 = "前二年以内" := by rfl
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
example : sourcePhraseText10 = "前項" := by rfl
example : replacementPhraseText10 = "第十一項において準用する前項" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "第四項" := by rfl
example : replacementPhraseText11 = "第十項" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "分割等前十年内事業年度の課税済金額" := by rfl
example : replacementPhraseText12 = "分割等前二年内事業年度の間接配当等又は間接課税済金額" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "前十年以内の各事業年度の課税済金額" := by rfl
example : replacementPhraseText13 = "前二年以内の各事業年度の間接配当等又は間接課税済金額" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead9d70083700
