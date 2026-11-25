import JapanTaxLaw.BatchTableRead840ad9aab5Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead840ad9aab5

example : sourcePhraseText0 = "第一項及び第四項" := by rfl
example : replacementPhraseText0 = "附則第二十七条の四の二第一項" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "前年度分の固定資産税" := by rfl
example : replacementPhraseText1 = "前年度分の都市計画税" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "宅地等の区分" := by rfl
example : replacementPhraseText2 = "住宅用地等（附則第二十七条の四の二第一項に規定する住宅用地等をいう。以下この項において同じ。）の区分" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "宅地等" := by rfl
example : replacementPhraseText3 = "住宅用地等" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "同年度の比準課税標準額" := by rfl
example : replacementPhraseText4 = "同年度分の固定資産税の課税標準となるべき価格に、当該住宅用地等の類似土地の前年度課税標準額（当該類似土地が令和五年度分の都市計画税について令和六年改正前の地方税法附則第二十七条の四又は第二十七条の四の二第一項第三号イ若しくはロの規定の適用を受ける土地である場合には、同年度分の都市計画税に係るこれらの規定に規定する都市計画税の課税標準となるべき額（当該類似土地が同年度分の固定資産税について令和六年改正前の地方税法第三百四十九条の三（第十八項を除く。）又は附則第十五条から第十五条の三までの規定の適用を受ける土地であるときは、当該額をこれらの規定に定める率で除して得た額））を当該類似土地の令和六年度分の固定資産税の課税標準となるべき価格で除して得た数値を乗じて得た額" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "同年度の比準課税標準額" := by rfl
example : replacementPhraseText5 = "同年度分の固定資産税の課税標準となるべき価格に、当該住宅用地等の類似土地の前年度課税標準額（当該類似土地が令和六年度分の都市計画税について附則第二十七条の四の二第一項第一号イ又はロの規定の適用を受ける土地である場合には、同年度分の都市計画税に係るこれらの規定に規定する都市計画税の課税標準となるべき額（当該類似土地が同年度分の固定資産税について令和七年改正前の地方税法第三百四十九条の三（第十八項を除く。）又は附則第十五条から第十五条の三までの規定の適用を受ける土地であるときは、当該額をこれらの規定に定める率で除して得た額））を当該類似土地の令和七年度分の固定資産税の課税標準となるべき価格で除して得た数値を乗じて得た額" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "同年度の比準課税標準額" := by rfl
example : replacementPhraseText6 = "同年度分の固定資産税の課税標準となるべき価格に、当該住宅用地等の類似土地の前年度課税標準額（当該類似土地が令和七年度分の都市計画税について附則第二十七条の四の二第一項第二号イ又はロの規定の適用を受ける土地である場合には、同年度分の都市計画税に係るこれらの規定に規定する都市計画税の課税標準となるべき額（当該類似土地が同年度分の固定資産税について令和八年改正前の地方税法第三百四十九条の三（第十八項を除く。）又は附則第十五条から第十五条の三までの規定の適用を受ける土地であるときは、当該額をこれらの規定に定める率で除して得た額））を当該類似土地の令和八年度分の固定資産税の課税標準となるべき価格で除して得た数値を乗じて得た額" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "なるべき額" := by rfl
example : replacementPhraseText7 = "なるべき額（当該特定用途宅地等が令和五年度分の都市計画税について令和六年改正前の地方税法附則第二十七条の四又は第二十七条の四の二第一項第三号イ若しくはロの規定の適用を受ける土地である場合には、同年度分の都市計画税に係るこれらの規定に規定する都市計画税の課税標準となるべき額）" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "なるべき額" := by rfl
example : replacementPhraseText8 = "なるべき額（当該特定用途宅地等が令和六年度分の都市計画税について附則第二十七条の四の二第一項第一号イ又はロの規定の適用を受ける土地である場合には、同年度分の都市計画税に係るこれらの規定に規定する都市計画税の課税標準となるべき額）" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "なるべき額" := by rfl
example : replacementPhraseText9 = "なるべき額（当該特定用途宅地等が令和七年度分の都市計画税について附則第二十七条の四の二第一項第二号イ又はロの規定の適用を受ける土地である場合には、同年度分の都市計画税に係るこれらの規定に規定する都市計画税の課税標準となるべき額）" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "附則第二十五条第六項において読み替えられた附則第十八条第六項第二号" := by rfl
example : replacementPhraseText10 = "附則第十八条第六項第二号" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "附則第十七条第七号に規定する比準課税標準額は、同号の規定" := by rfl
example : replacementPhraseText11 = "同条第六項第二号イ及び第三号イに掲げる額並びに同項第四号に定める額は、これらの規定" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "なるべき額" := by rfl
example : replacementPhraseText12 = "なるべき額（当該令和五年度類似特定用途宅地等が令和五年度分の都市計画税について令和六年改正前の地方税法附則第二十七条の四又は第二十七条の四の二第一項第三号イ若しくはロの規定の適用を受ける土地である場合には、同年度分の都市計画税に係るこれらの規定に規定する都市計画税の課税標準となるべき額）" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "なるべき額" := by rfl
example : replacementPhraseText13 = "なるべき額（当該令和六年度類似特定用途宅地等が令和六年度分の都市計画税について附則第二十七条の四の二第一項第一号イ又はロの規定の適用を受ける土地である場合には、同年度分の都市計画税に係るこれらの規定に規定する都市計画税の課税標準となるべき額）" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : sourcePhraseText14 = "なるべき額" := by rfl
example : replacementPhraseText14 = "なるべき額（当該令和七年度類似特定用途宅地等が令和七年度分の都市計画税について附則第二十七条の四の二第一項第二号イ又はロの規定の適用を受ける土地である場合には、同年度分の都市計画税に係るこれらの規定に規定する都市計画税の課税標準となるべき額）" := by rfl
example : applyReading Phrase.original14 = Phrase.replacement14 := by rfl
example : specReading Phrase.original14 = applyReading Phrase.original14 := agree_spec_impl Phrase.original14
example : sourcePhraseText15 = "前項の規定により読み替えられた附則第十八条第六項第一号" := by rfl
example : replacementPhraseText15 = "附則第十八条第六項第一号" := by rfl
example : applyReading Phrase.original15 = Phrase.replacement15 := by rfl
example : specReading Phrase.original15 = applyReading Phrase.original15 := agree_spec_impl Phrase.original15
example : sourcePhraseText16 = "前三項" := by rfl
example : replacementPhraseText16 = "第十八条第六項" := by rfl
example : applyReading Phrase.original16 = Phrase.replacement16 := by rfl
example : specReading Phrase.original16 = applyReading Phrase.original16 := agree_spec_impl Phrase.original16
example : sourcePhraseText17 = "第三項の規定により読み替えられた附則第十八条第六項第二号" := by rfl
example : replacementPhraseText17 = "附則第十八条第六項第二号" := by rfl
example : applyReading Phrase.original17 = Phrase.replacement17 := by rfl
example : specReading Phrase.original17 = applyReading Phrase.original17 := agree_spec_impl Phrase.original17
example : sourcePhraseText18 = "第一項から第三項まで" := by rfl
example : replacementPhraseText18 = "第十八条第六項" := by rfl
example : applyReading Phrase.original18 = Phrase.replacement18 := by rfl
example : specReading Phrase.original18 = applyReading Phrase.original18 := agree_spec_impl Phrase.original18
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead840ad9aab5
