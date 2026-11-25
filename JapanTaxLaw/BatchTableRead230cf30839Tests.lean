import JapanTaxLaw.BatchTableRead230cf30839Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead230cf30839

example : sourcePhraseText0 = "特定無形資産国外関連取引" := by rfl
example : replacementPhraseText0 = "特定特許権譲受等取引" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "の譲渡若しくは貸付け（特定無形資産に係る権利の設定その他他の者に特定無形資産を使用させる一切の行為を含む。）又はこれらに類似する" := by rfl
example : replacementPhraseText1 = "に係る" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "第二項各号" := by rfl
example : replacementPhraseText2 = "第二項各号（第五十九条の三第五項の規定により準じて算定する場合を含む。）" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "を第一項" := by rfl
example : replacementPhraseText3 = "を同条第四項" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "事業年度の" := by rfl
example : replacementPhraseText4 = "事業年度以後の各事業年度の" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "ならば第一項" := by rfl
example : replacementPhraseText5 = "ならば第五十九条の三第四項" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "特定無形資産国外関連取引" := by rfl
example : replacementPhraseText6 = "特定特許権譲受等取引" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "第二十五項の規定により各事業年度において" := by rfl
example : replacementPhraseText7 = "第五十九条の三第十五項の規定により" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "当該事業年度の確定申告書（法人税法第二条第三十一号に規定する確定申告書をいう。同項において同じ。）" := by rfl
example : replacementPhraseText8 = "確定申告書等" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "特定無形資産国外関連取引" := by rfl
example : replacementPhraseText9 = "特定特許権譲受等取引" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "同時文書化対象国外関連取引（第七項の規定の適用がある国外関連取引以外の国外関連取引" := by rfl
example : replacementPhraseText10 = "同時文書化対象特許権譲受等取引（国外関連取引に該当する第五十九条の三第二項第五号イに規定する特許権譲受等取引のうち第七項の規定の適用がないもの及び同条第九項に規定する同時文書化対象特許権譲受等取引" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "第六項" := by rfl
example : replacementPhraseText11 = "第六項若しくは同条第七項" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "同時文書化対象国外関連取引" := by rfl
example : replacementPhraseText12 = "同時文書化対象特許権譲受等取引" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "第六項" := by rfl
example : replacementPhraseText13 = "第六項若しくは第五十九条の三第七項" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : sourcePhraseText14 = "第一項" := by rfl
example : replacementPhraseText14 = "同条第四項" := by rfl
example : applyReading Phrase.original14 = Phrase.replacement14 := by rfl
example : specReading Phrase.original14 = applyReading Phrase.original14 := agree_spec_impl Phrase.original14
example : sourcePhraseText15 = "事業年度の" := by rfl
example : replacementPhraseText15 = "事業年度以後の各事業年度の" := by rfl
example : applyReading Phrase.original15 = Phrase.replacement15 := by rfl
example : specReading Phrase.original15 = applyReading Phrase.original15 := agree_spec_impl Phrase.original15
example : sourcePhraseText16 = "若しくはハ" := by rfl
example : replacementPhraseText16 = "若しくはハ（第五十九条の三第五項の規定により準じて算定する場合を含む。以下この号において同じ。）" := by rfl
example : applyReading Phrase.original16 = Phrase.replacement16 := by rfl
example : specReading Phrase.original16 = applyReading Phrase.original16 := agree_spec_impl Phrase.original16
example : sourcePhraseText17 = "同項第二号" := by rfl
example : replacementPhraseText17 = "第二項第二号" := by rfl
example : applyReading Phrase.original17 = Phrase.replacement17 := by rfl
example : specReading Phrase.original17 = applyReading Phrase.original17 := agree_spec_impl Phrase.original17
example : sourcePhraseText18 = "第二項第一号ニ" := by rfl
example : replacementPhraseText18 = "第二項第一号ニ（第五十九条の三第五項の規定により準じて算定する場合を含む。）" := by rfl
example : applyReading Phrase.original18 = Phrase.replacement18 := by rfl
example : specReading Phrase.original18 = applyReading Phrase.original18 := agree_spec_impl Phrase.original18
example : sourcePhraseText19 = "同項第二号" := by rfl
example : replacementPhraseText19 = "第二項第二号" := by rfl
example : applyReading Phrase.original19 = Phrase.replacement19 := by rfl
example : specReading Phrase.original19 = applyReading Phrase.original19 := agree_spec_impl Phrase.original19
example : sourcePhraseText20 = "同時文書化対象国外関連取引" := by rfl
example : replacementPhraseText20 = "同時文書化対象特許権譲受等取引" := by rfl
example : applyReading Phrase.original20 = Phrase.replacement20 := by rfl
example : specReading Phrase.original20 = applyReading Phrase.original20 := agree_spec_impl Phrase.original20
example : sourcePhraseText21 = "同時文書化免除国外関連取引" := by rfl
example : replacementPhraseText21 = "同時文書化免除特許権譲受等取引" := by rfl
example : applyReading Phrase.original21 = Phrase.replacement21 := by rfl
example : specReading Phrase.original21 = applyReading Phrase.original21 := agree_spec_impl Phrase.original21
example : sourcePhraseText22 = "第七項の規定の適用がある国外関連取引" := by rfl
example : replacementPhraseText22 = "国外関連取引に該当する第五十九条の三第二項第五号イに規定する特許権譲受等取引のうち第七項の規定の適用があるもの及び同条第十項に規定する同時文書化免除特許権譲受等取引" := by rfl
example : applyReading Phrase.original22 = Phrase.replacement22 := by rfl
example : specReading Phrase.original22 = applyReading Phrase.original22 := agree_spec_impl Phrase.original22
example : sourcePhraseText23 = "第一項" := by rfl
example : replacementPhraseText23 = "同条第四項" := by rfl
example : applyReading Phrase.original23 = Phrase.replacement23 := by rfl
example : specReading Phrase.original23 = applyReading Phrase.original23 := agree_spec_impl Phrase.original23
example : sourcePhraseText24 = "事業年度の" := by rfl
example : replacementPhraseText24 = "事業年度以後の各事業年度の" := by rfl
example : applyReading Phrase.original24 = Phrase.replacement24 := by rfl
example : specReading Phrase.original24 = applyReading Phrase.original24 := agree_spec_impl Phrase.original24
example : sourcePhraseText25 = "同時文書化免除国外関連取引" := by rfl
example : replacementPhraseText25 = "同時文書化免除特許権譲受等取引" := by rfl
example : applyReading Phrase.original25 = Phrase.replacement25 := by rfl
example : specReading Phrase.original25 = applyReading Phrase.original25 := agree_spec_impl Phrase.original25
example : sourcePhraseText26 = "同項の" := by rfl
example : replacementPhraseText26 = "第五十九条の三第四項の" := by rfl
example : applyReading Phrase.original26 = Phrase.replacement26 := by rfl
example : specReading Phrase.original26 = applyReading Phrase.original26 := agree_spec_impl Phrase.original26
example : sourcePhraseText27 = "租税特別措置法第六十六条の四第二十七項（" := by rfl
example : replacementPhraseText27 = "租税特別措置法第五十九条の三第十四項（特許権等の譲渡等による所得の課税の特例）において準用する同法第六十六条の四第二十七項（" := by rfl
example : applyReading Phrase.original27 = Phrase.replacement27 := by rfl
example : specReading Phrase.original27 = applyReading Phrase.original27 := agree_spec_impl Phrase.original27
example : sourcePhraseText28 = "及び租税特別措置法第六十六条の四第二十七項の" := by rfl
example : replacementPhraseText28 = "及び租税特別措置法第五十九条の三第十四項において準用する同法第六十六条の四第二十七項の" := by rfl
example : applyReading Phrase.original28 = Phrase.replacement28 := by rfl
example : specReading Phrase.original28 = applyReading Phrase.original28 := agree_spec_impl Phrase.original28
example : sourcePhraseText29 = "及び同法" := by rfl
example : replacementPhraseText29 = "及び同法第五十九条の三第十四項において準用する同法" := by rfl
example : applyReading Phrase.original29 = Phrase.replacement29 := by rfl
example : specReading Phrase.original29 = applyReading Phrase.original29 := agree_spec_impl Phrase.original29
example : sourcePhraseText30 = "「前条及び租税特別措置法" := by rfl
example : replacementPhraseText30 = "「前条及び租税特別措置法第五十九条の三第十四項において準用する同法" := by rfl
example : applyReading Phrase.original30 = Phrase.replacement30 := by rfl
example : specReading Phrase.original30 = applyReading Phrase.original30 := agree_spec_impl Phrase.original30
example : sourcePhraseText31 = "（租税特別措置法" := by rfl
example : replacementPhraseText31 = "（租税特別措置法第五十九条の三第十四項において準用する同法" := by rfl
example : applyReading Phrase.original31 = Phrase.replacement31 := by rfl
example : specReading Phrase.original31 = applyReading Phrase.original31 := agree_spec_impl Phrase.original31
example : sourcePhraseText32 = "並びに租税特別措置法" := by rfl
example : replacementPhraseText32 = "並びに租税特別措置法第五十九条の三第十四項において準用する同法" := by rfl
example : applyReading Phrase.original32 = Phrase.replacement32 := by rfl
example : specReading Phrase.original32 = applyReading Phrase.original32 := agree_spec_impl Phrase.original32
example : sourcePhraseText33 = "、租税特別措置法" := by rfl
example : replacementPhraseText33 = "、租税特別措置法第五十九条の三第十四項において準用する同法" := by rfl
example : applyReading Phrase.original33 = Phrase.replacement33 := by rfl
example : specReading Phrase.original33 = applyReading Phrase.original33 := agree_spec_impl Phrase.original33
example : sourcePhraseText34 = "を第一項" := by rfl
example : replacementPhraseText34 = "を第五十九条の三第四項" := by rfl
example : applyReading Phrase.original34 = Phrase.replacement34 := by rfl
example : specReading Phrase.original34 = applyReading Phrase.original34 := agree_spec_impl Phrase.original34
example : sourcePhraseText35 = "租税特別措置法" := by rfl
example : replacementPhraseText35 = "租税特別措置法第五十九条の三第十四項（特許権等の譲渡等による所得の課税の特例）において準用する同法" := by rfl
example : applyReading Phrase.original35 = Phrase.replacement35 := by rfl
example : specReading Phrase.original35 = applyReading Phrase.original35 := agree_spec_impl Phrase.original35
example : sourcePhraseText36 = "同法第六十六条の四第二十七項" := by rfl
example : replacementPhraseText36 = "同法第五十九条の三第十四項において準用する同法第六十六条の四第二十七項" := by rfl
example : applyReading Phrase.original36 = Phrase.replacement36 := by rfl
example : specReading Phrase.original36 = applyReading Phrase.original36 := agree_spec_impl Phrase.original36
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead230cf30839
