import JapanTaxLaw.BatchTableRead9115f29e40Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead9115f29e40

example : sourcePhraseText0 = "第二項各号" := by rfl
example : replacementPhraseText0 = "第四十一条の十九の五第二項の規定により第二項に規定する方法に準じて算定する場合における同項各号" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "を第一項" := by rfl
example : replacementPhraseText1 = "を同条第一項" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "所得税法第百六十四条第一項第一号イに掲げる国内源泉所得につき同法第百六十五条第一項の規定により同法第二十二条の規定に準じて計算した金額又は同法第二条第一項第二十五号に規定する純損失の金額につき同項第四十三号" := by rfl
example : replacementPhraseText2 = "所得税の額から控除する金額につき所得税法第二条第一項第四十三号" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "ならば第一項" := by rfl
example : replacementPhraseText3 = "ならば第四十一条の十九の五第一項" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "第四項の規定の適用がある内部取引以外の内部取引" := by rfl
example : replacementPhraseText4 = "第四十一条の十九の五第五項に規定する同時文書化対象内部取引" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "第三項" := by rfl
example : replacementPhraseText5 = "同条第三項" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "第三項第一項に" := by rfl
example : replacementPhraseText6 = "第四十一条の十九の五第三項同条第一項に" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "として財務省令" := by rfl
example : replacementPhraseText7 = "として同条第五項に規定する財務省令" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "所得税法第百六十四条第一項第一号イに掲げる国内源泉所得につき同法第百六十五条第一項の規定により同法第二十二条の規定に準じて計算した金額又は同法第二条第一項第二十五号に規定する純損失の金額" := by rfl
example : replacementPhraseText8 = "所得税の額から控除する金額" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "第二項第一号ロ" := by rfl
example : replacementPhraseText9 = "第四十一条の十九の五第二項の規定により第二項に規定する方法に準じて算定する場合における同項第一号ロ" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "第二項第一号ニ" := by rfl
example : replacementPhraseText10 = "第四十一条の十九の五第二項の規定により第二項に規定する方法に準じて算定する場合における同項第一号ニ" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "第四項の規定の適用がある内部取引" := by rfl
example : replacementPhraseText11 = "第四十一条の十九の五第六項に規定する同時文書化免除内部取引" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "第一項に" := by rfl
example : replacementPhraseText12 = "同条第一項に" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "財務省令" := by rfl
example : replacementPhraseText13 = "同条第六項に規定する財務省令" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : sourcePhraseText14 = "所得税法第百六十四条第一項第一号イに掲げる国内源泉所得につき同法第百六十五条第一項の規定により同法第二十二条の規定に準じて計算した金額又は同法第二条第一項第二十五号に規定する純損失の金額" := by rfl
example : replacementPhraseText14 = "所得税の額から控除する金額" := by rfl
example : applyReading Phrase.original14 = Phrase.replacement14 := by rfl
example : specReading Phrase.original14 = applyReading Phrase.original14 := agree_spec_impl Phrase.original14
example : sourcePhraseText15 = "同項の" := by rfl
example : replacementPhraseText15 = "第四十一条の十九の五第一項の" := by rfl
example : applyReading Phrase.original15 = Phrase.replacement15 := by rfl
example : specReading Phrase.original15 = applyReading Phrase.original15 := agree_spec_impl Phrase.original15
example : sourcePhraseText16 = "第四十条の三の三第二十二項（" := by rfl
example : replacementPhraseText16 = "第四十一条の十九の五第十三項（国外所得金額の計算の特例）において準用する同法第四十条の三の三第二十二項（" := by rfl
example : applyReading Phrase.original16 = Phrase.replacement16 := by rfl
example : specReading Phrase.original16 = applyReading Phrase.original16 := agree_spec_impl Phrase.original16
example : sourcePhraseText17 = "第四十条の三の三第二十二項の" := by rfl
example : replacementPhraseText17 = "第四十一条の十九の五第十三項において準用する同法第四十条の三の三第二十二項の" := by rfl
example : applyReading Phrase.original17 = Phrase.replacement17 := by rfl
example : specReading Phrase.original17 = applyReading Phrase.original17 := agree_spec_impl Phrase.original17
example : sourcePhraseText18 = "及び同法" := by rfl
example : replacementPhraseText18 = "及び同法第四十一条の十九の五第十三項において準用する同法" := by rfl
example : applyReading Phrase.original18 = Phrase.replacement18 := by rfl
example : specReading Phrase.original18 = applyReading Phrase.original18 := agree_spec_impl Phrase.original18
example : sourcePhraseText19 = "「前条及び租税特別措置法" := by rfl
example : replacementPhraseText19 = "「前条及び租税特別措置法第四十一条の十九の五第十三項において準用する同法" := by rfl
example : applyReading Phrase.original19 = Phrase.replacement19 := by rfl
example : specReading Phrase.original19 = applyReading Phrase.original19 := agree_spec_impl Phrase.original19
example : sourcePhraseText20 = "内部取引価格を第一項" := by rfl
example : replacementPhraseText20 = "第四十一条の十九の五第一項に規定する内部取引の対価の額とした額を同項" := by rfl
example : applyReading Phrase.original20 = Phrase.replacement20 := by rfl
example : specReading Phrase.original20 = applyReading Phrase.original20 := agree_spec_impl Phrase.original20
example : sourcePhraseText21 = "租税特別措置法" := by rfl
example : replacementPhraseText21 = "租税特別措置法第四十一条の十九の五第十三項（国外所得金額の計算の特例）において準用する同法" := by rfl
example : applyReading Phrase.original21 = Phrase.replacement21 := by rfl
example : specReading Phrase.original21 = applyReading Phrase.original21 := agree_spec_impl Phrase.original21
example : sourcePhraseText22 = "同法第四十条の三の三第二十二項" := by rfl
example : replacementPhraseText22 = "同法第四十一条の十九の五第十三項において準用する同法第四十条の三の三第二十二項" := by rfl
example : applyReading Phrase.original22 = Phrase.replacement22 := by rfl
example : specReading Phrase.original22 = applyReading Phrase.original22 := agree_spec_impl Phrase.original22
example : sourcePhraseText23 = "非居住者の恒久的施設と当該非居住者" := by rfl
example : replacementPhraseText23 = "居住者の第四十一条の十九の五第一項に規定する事業場等と当該居住者の同項に規定する国外事業所等" := by rfl
example : applyReading Phrase.original23 = Phrase.replacement23 := by rfl
example : specReading Phrase.original23 = applyReading Phrase.original23 := agree_spec_impl Phrase.original23
example : sourcePhraseText24 = "の居住者とされる" := by rfl
example : replacementPhraseText24 = "に所在する" := by rfl
example : applyReading Phrase.original24 = Phrase.replacement24 := by rfl
example : specReading Phrase.original24 = applyReading Phrase.original24 := agree_spec_impl Phrase.original24
example : sourcePhraseText25 = "の事業場等との" := by rfl
example : replacementPhraseText25 = "との" := by rfl
example : applyReading Phrase.original25 = Phrase.replacement25 := by rfl
example : specReading Phrase.original25 = applyReading Phrase.original25 := agree_spec_impl Phrase.original25
example : sourcePhraseText26 = "に係る第一項" := by rfl
example : replacementPhraseText26 = "に係る第四十一条の十九の五第一項" := by rfl
example : applyReading Phrase.original26 = Phrase.replacement26 := by rfl
example : specReading Phrase.original26 = applyReading Phrase.original26 := agree_spec_impl Phrase.original26
example : sourcePhraseText27 = "、当該非居住者" := by rfl
example : replacementPhraseText27 = "、当該居住者" := by rfl
example : applyReading Phrase.original27 = Phrase.replacement27 := by rfl
example : specReading Phrase.original27 = applyReading Phrase.original27 := agree_spec_impl Phrase.original27
example : sourcePhraseText28 = "第四十条の三の四第一項（" := by rfl
example : replacementPhraseText28 = "第四十一条の十九の五第十三項（国外所得金額の計算の特例）において準用する同法第四十条の三の四第一項（" := by rfl
example : applyReading Phrase.original28 = Phrase.replacement28 := by rfl
example : specReading Phrase.original28 = applyReading Phrase.original28 := agree_spec_impl Phrase.original28
example : sourcePhraseText29 = "第四十条の三の四第一項の" := by rfl
example : replacementPhraseText29 = "第四十一条の十九の五第十三項において準用する同法第四十条の三の四第一項の" := by rfl
example : applyReading Phrase.original29 = Phrase.replacement29 := by rfl
example : specReading Phrase.original29 = applyReading Phrase.original29 := agree_spec_impl Phrase.original29
example : sourcePhraseText30 = "第四十条の三の四第一項（" := by rfl
example : replacementPhraseText30 = "第四十一条の十九の五第十三項（国外所得金額の計算の特例）において準用する同法第四十条の三の四第一項（" := by rfl
example : applyReading Phrase.original30 = Phrase.replacement30 := by rfl
example : specReading Phrase.original30 = applyReading Phrase.original30 := agree_spec_impl Phrase.original30
example : sourcePhraseText31 = "第四十条の三の四第一項の" := by rfl
example : replacementPhraseText31 = "第四十一条の十九の五第十三項において準用する同法第四十条の三の四第一項の" := by rfl
example : applyReading Phrase.original31 = Phrase.replacement31 := by rfl
example : specReading Phrase.original31 = applyReading Phrase.original31 := agree_spec_impl Phrase.original31
example : sourcePhraseText32 = "猶予の要件等）、" := by rfl
example : replacementPhraseText32 = "猶予の要件等）の規定、" := by rfl
example : applyReading Phrase.original32 = Phrase.replacement32 := by rfl
example : specReading Phrase.original32 = applyReading Phrase.original32 := agree_spec_impl Phrase.original32
example : sourcePhraseText33 = "猶予）又は" := by rfl
example : replacementPhraseText33 = "猶予）の規定又は" := by rfl
example : applyReading Phrase.original33 = Phrase.replacement33 := by rfl
example : specReading Phrase.original33 = applyReading Phrase.original33 := agree_spec_impl Phrase.original33
example : sourcePhraseText34 = "若しくは租税特別措置法" := by rfl
example : replacementPhraseText34 = "若しくは租税特別措置法第四十一条の十九の五第十三項において準用する同法" := by rfl
example : applyReading Phrase.original34 = Phrase.replacement34 := by rfl
example : specReading Phrase.original34 = applyReading Phrase.original34 := agree_spec_impl Phrase.original34
example : sourcePhraseText35 = "含む。）又は租税特別措置法" := by rfl
example : replacementPhraseText35 = "含む。）又は租税特別措置法第四十一条の十九の五第十三項において準用する同法" := by rfl
example : applyReading Phrase.original35 = Phrase.replacement35 := by rfl
example : specReading Phrase.original35 = applyReading Phrase.original35 := agree_spec_impl Phrase.original35
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead9115f29e40
