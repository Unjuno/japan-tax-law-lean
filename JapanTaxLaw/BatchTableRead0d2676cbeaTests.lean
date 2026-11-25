import JapanTaxLaw.BatchTableRead0d2676cbeaSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead0d2676cbea

example : sourcePhraseText0 = "第三十五条" := by rfl
example : replacementPhraseText0 = "第三十七条第一項において準用する法第三十五条" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "第三十五条" := by rfl
example : replacementPhraseText1 = "第三十七条第一項において準用する法第三十五条" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "法人税に係る延滞税は、租税特別措置法第六十六条の四第一項" := by rfl
example : replacementPhraseText2 = "所得税に係る延滞税又は法人税に係る延滞税は、租税特別措置法第四十条の三の三第一項若しくは第六十六条の四の三第一項又は第四十一条の十九の五第一項若しくは第六十七条の十八第一項" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "納付すべき法人税の" := by rfl
example : replacementPhraseText3 = "納付すべき所得税の額又は法人税の" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "から同項" := by rfl
example : replacementPhraseText4 = "からこれら" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "、同項" := by rfl
example : replacementPhraseText5 = "、租税特別措置法第六十六条の四の三第一項又は第六十七条の十八第一項" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "第三十六条第一項に規定する法人税の額及び" := by rfl
example : replacementPhraseText6 = "第三十七条第一項において準用する法第三十六条第一項に規定する所得税の額又は法人税の額及び" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "当該法人税" := by rfl
example : replacementPhraseText7 = "当該所得税の額又は法人税" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "第三十六条第一項" := by rfl
example : replacementPhraseText8 = "第三十七条第一項において準用する法第三十六条第一項" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "第六十六条の四第一項" := by rfl
example : replacementPhraseText9 = "第四十条の三の三第一項若しくは第六十六条の四の三第一項又は第四十一条の十九の五第一項若しくは第六十七条の十八第一項" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "同条第二十七項第一号" := by rfl
example : replacementPhraseText10 = "同法第四十条の三の三第二十二項第一号若しくは同法第六十六条の四の三第十四項において準用する同法第六十六条の四第二十七項第一号又は同法第四十一条の十九の五第十三項において準用する同法第四十条の三の三第二十二項第一号若しくは同法第六十七条の十八第十三項において準用する同法第六十六条の四第二十七項第一号" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "法人税の額（" := by rfl
example : replacementPhraseText11 = "所得税の額又は法人税の額（" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "更正決定に係る法人税の額" := by rfl
example : replacementPhraseText12 = "更正決定に係る所得税の額又は法人税の額" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "法人税の額に" := by rfl
example : replacementPhraseText13 = "所得税の額又は法人税の額に" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : sourcePhraseText14 = "猶予対象以外の法人税の額" := by rfl
example : replacementPhraseText14 = "猶予対象以外の所得税の額又は法人税の額" := by rfl
example : applyReading Phrase.original14 = Phrase.replacement14 := by rfl
example : specReading Phrase.original14 = applyReading Phrase.original14 := agree_spec_impl Phrase.original14
example : sourcePhraseText15 = "更正決定に係る法人税の額" := by rfl
example : replacementPhraseText15 = "更正決定に係る所得税の額又は法人税の額" := by rfl
example : applyReading Phrase.original15 = Phrase.replacement15 := by rfl
example : specReading Phrase.original15 = applyReading Phrase.original15 := agree_spec_impl Phrase.original15
example : sourcePhraseText16 = "猶予対象以外の法人税の額" := by rfl
example : replacementPhraseText16 = "猶予対象以外の所得税の額又は法人税の額" := by rfl
example : applyReading Phrase.original16 = Phrase.replacement16 := by rfl
example : specReading Phrase.original16 = applyReading Phrase.original16 := agree_spec_impl Phrase.original16
example : sourcePhraseText17 = "第三十六条第一項" := by rfl
example : replacementPhraseText17 = "第三十七条第一項において準用する法第三十六条第一項" := by rfl
example : applyReading Phrase.original17 = Phrase.replacement17 := by rfl
example : specReading Phrase.original17 = applyReading Phrase.original17 := agree_spec_impl Phrase.original17
example : sourcePhraseText18 = "第六十六条の四第一項" := by rfl
example : replacementPhraseText18 = "第六十六条の四の三第一項又は第六十七条の十八第一項" := by rfl
example : applyReading Phrase.original18 = Phrase.replacement18 := by rfl
example : specReading Phrase.original18 = applyReading Phrase.original18 := agree_spec_impl Phrase.original18
example : sourcePhraseText19 = "同条第二十七項第三号" := by rfl
example : replacementPhraseText19 = "同法第六十六条の四の三第十四項において準用する同法第六十六条の四第二十七項第三号又は同法第六十七条の十八第十三項において準用する同法第六十六条の四第二十七項第三号" := by rfl
example : applyReading Phrase.original19 = Phrase.replacement19 := by rfl
example : specReading Phrase.original19 = applyReading Phrase.original19 := agree_spec_impl Phrase.original19
example : sourcePhraseText20 = "第三十六条第一項に規定する確認" := by rfl
example : replacementPhraseText20 = "第三十七条第一項において準用する法第三十六条第一項に規定する確認" := by rfl
example : applyReading Phrase.original20 = Phrase.replacement20 := by rfl
example : specReading Phrase.original20 = applyReading Phrase.original20 := agree_spec_impl Phrase.original20
example : sourcePhraseText21 = "法人税" := by rfl
example : replacementPhraseText21 = "所得税又は法人税" := by rfl
example : applyReading Phrase.original21 = Phrase.replacement21 := by rfl
example : specReading Phrase.original21 = applyReading Phrase.original21 := agree_spec_impl Phrase.original21
example : sourcePhraseText22 = "第三十六条第一項" := by rfl
example : replacementPhraseText22 = "第三十七条第一項において準用する法第三十六条第一項" := by rfl
example : applyReading Phrase.original22 = Phrase.replacement22 := by rfl
example : specReading Phrase.original22 = applyReading Phrase.original22 := agree_spec_impl Phrase.original22
example : sourcePhraseText23 = "法人税の額及び" := by rfl
example : replacementPhraseText23 = "所得税の額又は法人税の額及び" := by rfl
example : applyReading Phrase.original23 = Phrase.replacement23 := by rfl
example : specReading Phrase.original23 = applyReading Phrase.original23 := agree_spec_impl Phrase.original23
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead0d2676cbea
