import JapanTaxLaw.BatchTableRead7cf895ef5eSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead7cf895ef5e

example : sourcePhraseText0 = "前項" := by rfl
example : replacementPhraseText0 = "第四十一条の十三の三第一項" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "第一項の" := by rfl
example : replacementPhraseText1 = "第四十一条の十三の三第一項の" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "同条第一項中" := by rfl
example : replacementPhraseText2 = "同法第十三条第一項中" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "第五条の二第三項" := by rfl
example : replacementPhraseText3 = "第四十一条の十三の三第十二項（振替割引債の差益金額等の課税の特例）において準用する同法第五条の二第三項" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "同項に規定する振替国債又は振替地方債の利子" := by rfl
example : replacementPhraseText4 = "同法第四十一条の十三の三第一項に規定する特定振替割引債の償還金" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "第一項の" := by rfl
example : replacementPhraseText5 = "第四十一条の十三の三第一項の" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "前項第四号" := by rfl
example : replacementPhraseText6 = "第四十一条の十三の三第七項第四号" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "第十五項" := by rfl
example : replacementPhraseText7 = "第四十一条の十三の三第十項若しくは第十一項" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "第七項第四号" := by rfl
example : replacementPhraseText8 = "第四十一条の十三の三第七項第四号" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "第一項又は" := by rfl
example : replacementPhraseText9 = "第四十一条の十三の三第一項又は" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "第一項に" := by rfl
example : replacementPhraseText10 = "同条第一項に" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "第一項" := by rfl
example : replacementPhraseText11 = "第四十一条の十三の三第一項" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "第一項又は第一項」とあるのは" := by rfl
example : replacementPhraseText12 = "第四十一条の十三の三第一項又は同条第一項」とあるのは" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "第一項」と、" := by rfl
example : replacementPhraseText13 = "第四十一条の十三の三第一項」と、" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : sourcePhraseText14 = "第一項の、第一項" := by rfl
example : replacementPhraseText14 = "第四十一条の十三の三第一項の、同条第一項" := by rfl
example : applyReading Phrase.original14 = Phrase.replacement14 := by rfl
example : specReading Phrase.original14 = applyReading Phrase.original14 := agree_spec_impl Phrase.original14
example : sourcePhraseText15 = "第一項の同項、" := by rfl
example : replacementPhraseText15 = "第四十一条の十三の三第一項の同項、同条第六項及び第十一項並びに" := by rfl
example : applyReading Phrase.original15 = Phrase.replacement15 := by rfl
example : specReading Phrase.original15 = applyReading Phrase.original15 := agree_spec_impl Phrase.original15
example : sourcePhraseText16 = "ついては" := by rfl
example : replacementPhraseText16 = "ついては、同条第六項中「同項に規定する特定振替機関等」とあるのは「同条第十二項において準用する同法第五条の二第十九項（振替国債等の利子の課税の特例）の規定により読み替えられた同法第四十一条の十三の三第一項に規定する特定受託者」と、同条第十一項中「適格口座管理機関又は適格外国仲介業者」とあるのは「第一項に規定する特定受託者又は適格外国仲介業者」と、「当該適格口座管理機関」とあるのは「特定振替機関」とするほか" := by rfl
example : applyReading Phrase.original16 = Phrase.replacement16 := by rfl
example : specReading Phrase.original16 = applyReading Phrase.original16 := agree_spec_impl Phrase.original16
example : sourcePhraseText17 = "第一項当該特定振替機関等" := by rfl
example : replacementPhraseText17 = "第四十一条の十三の三第一項当該特定振替機関等（" := by rfl
example : applyReading Phrase.original17 = Phrase.replacement17 := by rfl
example : specReading Phrase.original17 = applyReading Phrase.original17 := agree_spec_impl Phrase.original17
example : sourcePhraseText18 = "第十九項" := by rfl
example : replacementPhraseText18 = "第五条の二第十九項" := by rfl
example : applyReading Phrase.original18 = Phrase.replacement18 := by rfl
example : specReading Phrase.original18 = applyReading Phrase.original18 := agree_spec_impl Phrase.original18
example : sourcePhraseText19 = "受託者をいう。以下この条において同じ。）" := by rfl
example : replacementPhraseText19 = "受託者をいい、" := by rfl
example : applyReading Phrase.original19 = Phrase.replacement19 := by rfl
example : specReading Phrase.original19 = applyReading Phrase.original19 := agree_spec_impl Phrase.original19
example : sourcePhraseText20 = "の特定受託者" := by rfl
example : replacementPhraseText20 = "の特定受託者（同項に規定する特定受託者をいう。以下この条において同じ。）" := by rfl
example : applyReading Phrase.original20 = Phrase.replacement20 := by rfl
example : specReading Phrase.original20 = applyReading Phrase.original20 := agree_spec_impl Phrase.original20
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead7cf895ef5e
