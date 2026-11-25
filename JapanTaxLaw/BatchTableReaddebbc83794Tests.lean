import JapanTaxLaw.BatchTableReaddebbc83794Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableReaddebbc83794

example : sourcePhraseText0 = "第一項、第四項又は前項" := by rfl
example : replacementPhraseText0 = "次条第一項" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "第一項中" := by rfl
example : replacementPhraseText1 = "同項中" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "「事業年度」と、第四項及び前項中「、解散（合併による解散を除く。）の日を含む事業年度及び清算中の各事業年度を除く」とあるのは「を除く" := by rfl
example : replacementPhraseText2 = "、「事業年度" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "第一項に" := by rfl
example : replacementPhraseText3 = "次条第一項に" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "限る。）又は当該通算法人の第四項に規定する事業年度（当該通算法人に係る通算親法人の同項に規定する事業年度終了の日に終了する事業年度に限る" := by rfl
example : replacementPhraseText4 = "限る" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "試験研究費の額が" := by rfl
example : replacementPhraseText5 = "特別試験研究費の額（次条第一項に規定する特別試験研究費の額をいう。以下この条において同じ。）が" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "第一項又は第四項の試験研究費の額" := by rfl
example : replacementPhraseText6 = "同項の特別試験研究費の額" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "第一項の税額控除限度額又は第四項の中小企業者等税額控除限度額" := by rfl
example : replacementPhraseText7 = "次条第一項の税額控除限度額" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "控除対象試験研究費の額" := by rfl
example : replacementPhraseText8 = "控除対象特別試験研究費の額（次条第一項第一号に規定する控除対象特別試験研究費の額をいう。以下この条において同じ。）" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "に、次に掲げる場合の区分に応じそれぞれ次に定める割合（当該割合に小数点以下三位未満の端数があるときはこれを切り捨てた割合とし、それぞれ次に定める割合が百分の十を超えるときは百分の十とする。）を乗じて計算した金額（第四項の規定の適用を受ける場合には" := by rfl
example : replacementPhraseText9 = "のうち同号に規定する政令で定める金額の百分の三十に相当する金額" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "の百分の十二に相当する金額）" := by rfl
example : replacementPhraseText10 = "のうち同項第二号に規定する政令で定める金額の百分の二十五に相当する金額並びに当該合計額のうち同項第一号及び第二号に規定する政令で定める金額以外の金額の百分の二十に相当する金額の合計額" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "百分の二十五" := by rfl
example : replacementPhraseText11 = "百分の十" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "の試験研究費の額" := by rfl
example : replacementPhraseText12 = "の特別試験研究費の額" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "の控除対象試験研究費の額" := by rfl
example : replacementPhraseText13 = "の控除対象特別試験研究費の額" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : sourcePhraseText14 = "百分の二十五" := by rfl
example : replacementPhraseText14 = "百分の十" := by rfl
example : applyReading Phrase.original14 = Phrase.replacement14 := by rfl
example : specReading Phrase.original14 = applyReading Phrase.original14 := agree_spec_impl Phrase.original14
example : sourcePhraseText15 = "第一項後段及び第四項後段" := by rfl
example : replacementPhraseText15 = "次条第一項後段" := by rfl
example : applyReading Phrase.original15 = Phrase.replacement15 := by rfl
example : specReading Phrase.original15 = applyReading Phrase.original15 := agree_spec_impl Phrase.original15
example : sourcePhraseText16 = "の試験研究費の額" := by rfl
example : replacementPhraseText16 = "の特別試験研究費の額" := by rfl
example : applyReading Phrase.original16 = Phrase.replacement16 := by rfl
example : specReading Phrase.original16 = applyReading Phrase.original16 := agree_spec_impl Phrase.original16
example : sourcePhraseText17 = "係る第一項又は第四項" := by rfl
example : replacementPhraseText17 = "係る次条第一項" := by rfl
example : applyReading Phrase.original17 = Phrase.replacement17 := by rfl
example : specReading Phrase.original17 = applyReading Phrase.original17 := agree_spec_impl Phrase.original17
example : sourcePhraseText18 = "第二十一項" := by rfl
example : replacementPhraseText18 = "同条第四項" := by rfl
example : applyReading Phrase.original18 = Phrase.replacement18 := by rfl
example : specReading Phrase.original18 = applyReading Phrase.original18 := agree_spec_impl Phrase.original18
example : sourcePhraseText19 = "、第一項又は第四項" := by rfl
example : replacementPhraseText19 = "、同条第一項" := by rfl
example : applyReading Phrase.original19 = Phrase.replacement19 := by rfl
example : specReading Phrase.original19 = applyReading Phrase.original19 := agree_spec_impl Phrase.original19
example : sourcePhraseText20 = "控除対象試験研究費の額" := by rfl
example : replacementPhraseText20 = "控除対象特別試験研究費の額" := by rfl
example : applyReading Phrase.original20 = Phrase.replacement20 := by rfl
example : specReading Phrase.original20 = applyReading Phrase.original20 := agree_spec_impl Phrase.original20
example : sourcePhraseText21 = "の試験研究費の額" := by rfl
example : replacementPhraseText21 = "の特別試験研究費の額" := by rfl
example : applyReading Phrase.original21 = Phrase.replacement21 := by rfl
example : specReading Phrase.original21 = applyReading Phrase.original21 := agree_spec_impl Phrase.original21
example : sourcePhraseText22 = "控除対象試験研究費の額" := by rfl
example : replacementPhraseText22 = "控除対象特別試験研究費の額" := by rfl
example : applyReading Phrase.original22 = Phrase.replacement22 := by rfl
example : specReading Phrase.original22 = applyReading Phrase.original22 := agree_spec_impl Phrase.original22
example : sourcePhraseText23 = "）が第一項又は第四項" := by rfl
example : replacementPhraseText23 = "）が次条第一項" := by rfl
example : applyReading Phrase.original23 = Phrase.replacement23 := by rfl
example : specReading Phrase.original23 = applyReading Phrase.original23 := agree_spec_impl Phrase.original23
example : sourcePhraseText24 = "これらの規定" := by rfl
example : replacementPhraseText24 = "同項" := by rfl
example : applyReading Phrase.original24 = Phrase.replacement24 := by rfl
example : specReading Phrase.original24 = applyReading Phrase.original24 := agree_spec_impl Phrase.original24
example : sourcePhraseText25 = "第一項又は第四項に" := by rfl
example : replacementPhraseText25 = "同条第一項に" := by rfl
example : applyReading Phrase.original25 = Phrase.replacement25 := by rfl
example : specReading Phrase.original25 = applyReading Phrase.original25 := agree_spec_impl Phrase.original25
example : sourcePhraseText26 = "事業年度が第一項又は第四項" := by rfl
example : replacementPhraseText26 = "事業年度が同条第一項" := by rfl
example : applyReading Phrase.original26 = Phrase.replacement26 := by rfl
example : specReading Phrase.original26 = applyReading Phrase.original26 := agree_spec_impl Phrase.original26
example : sourcePhraseText27 = "百分の二十五に相当する金額（次に掲げる場合に該当する場合には、それぞれ次に定める金額を加算した金額）" := by rfl
example : replacementPhraseText27 = "百分の十に相当する金額" := by rfl
example : applyReading Phrase.original27 = Phrase.replacement27 := by rfl
example : specReading Phrase.original27 = applyReading Phrase.original27 := agree_spec_impl Phrase.original27
example : sourcePhraseText28 = "第一項の控除上限額又は第四項若しくは第七項の中小企業者等控除上限額" := by rfl
example : replacementPhraseText28 = "次条第一項に規定する百分の十に相当する金額" := by rfl
example : applyReading Phrase.original28 = Phrase.replacement28 := by rfl
example : specReading Phrase.original28 = applyReading Phrase.original28 := agree_spec_impl Phrase.original28
example : sourcePhraseText29 = "の第一項又は第四項" := by rfl
example : replacementPhraseText29 = "の次条第一項" := by rfl
example : applyReading Phrase.original29 = Phrase.replacement29 := by rfl
example : specReading Phrase.original29 = applyReading Phrase.original29 := agree_spec_impl Phrase.original29
example : sourcePhraseText30 = "これらの規定" := by rfl
example : replacementPhraseText30 = "同項" := by rfl
example : applyReading Phrase.original30 = Phrase.replacement30 := by rfl
example : specReading Phrase.original30 = applyReading Phrase.original30 := agree_spec_impl Phrase.original30
example : sourcePhraseText31 = "おける第一項又は第四項" := by rfl
example : replacementPhraseText31 = "おける同条第一項" := by rfl
example : applyReading Phrase.original31 = Phrase.replacement31 := by rfl
example : specReading Phrase.original31 = applyReading Phrase.original31 := agree_spec_impl Phrase.original31
example : sourcePhraseText32 = "次条第二項又は第四十二条の五第三項第二号" := by rfl
example : replacementPhraseText32 = "第四十二条の五第三項第二号" := by rfl
example : applyReading Phrase.original32 = Phrase.replacement32 := by rfl
example : specReading Phrase.original32 = applyReading Phrase.original32 := agree_spec_impl Phrase.original32
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableReaddebbc83794
