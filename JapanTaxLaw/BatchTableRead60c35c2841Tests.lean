import JapanTaxLaw.BatchTableRead60c35c2841Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead60c35c2841

example : sourcePhraseText0 = "前項" := by rfl
example : replacementPhraseText0 = "次条第一項" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "第一項の" := by rfl
example : replacementPhraseText1 = "次条第一項の" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "同条第一項中" := by rfl
example : replacementPhraseText2 = "同法第十三条第一項中" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "第五条の二第三項" := by rfl
example : replacementPhraseText3 = "第五条の三第九項（振替社債等の利子の課税の特例）において準用する同法第五条の二第三項" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "同項に規定する振替国債又は振替地方債" := by rfl
example : replacementPhraseText4 = "同法第五条の三第一項に規定する特定振替社債等" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "第一項の" := by rfl
example : replacementPhraseText5 = "次条第一項の" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "第一項及び前項" := by rfl
example : replacementPhraseText6 = "次条第一項及び第三項" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "第五条の二第一項（振替国債等の利子の課税の特例）" := by rfl
example : replacementPhraseText7 = "第五条の三第一項（振替社債等の利子の課税の特例）" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "振替国債又は振替地方債" := by rfl
example : replacementPhraseText8 = "特定振替社債等" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "同条第五項後段" := by rfl
example : replacementPhraseText9 = "同条第三項後段" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "第五条の二第一項又は第五項後段" := by rfl
example : replacementPhraseText10 = "第五条の三第一項又は第三項後段" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "第五条の二第五項後段" := by rfl
example : replacementPhraseText11 = "第五条の三第三項後段" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "前項第四号" := by rfl
example : replacementPhraseText12 = "次条第四項第四号" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "第十五項" := by rfl
example : replacementPhraseText13 = "次条第七項若しくは第八項" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : sourcePhraseText14 = "第七項第四号" := by rfl
example : replacementPhraseText14 = "次条第四項第四号" := by rfl
example : applyReading Phrase.original14 = Phrase.replacement14 := by rfl
example : specReading Phrase.original14 = applyReading Phrase.original14 := agree_spec_impl Phrase.original14
example : sourcePhraseText15 = "第一項又は" := by rfl
example : replacementPhraseText15 = "次条第一項又は" := by rfl
example : applyReading Phrase.original15 = Phrase.replacement15 := by rfl
example : specReading Phrase.original15 = applyReading Phrase.original15 := agree_spec_impl Phrase.original15
example : sourcePhraseText16 = "第一項に" := by rfl
example : replacementPhraseText16 = "同条第一項に" := by rfl
example : applyReading Phrase.original16 = Phrase.replacement16 := by rfl
example : specReading Phrase.original16 = applyReading Phrase.original16 := agree_spec_impl Phrase.original16
example : sourcePhraseText17 = "第一項" := by rfl
example : replacementPhraseText17 = "次条第一項" := by rfl
example : applyReading Phrase.original17 = Phrase.replacement17 := by rfl
example : specReading Phrase.original17 = applyReading Phrase.original17 := agree_spec_impl Phrase.original17
example : sourcePhraseText18 = "第五項後段" := by rfl
example : replacementPhraseText18 = "同条第三項後段" := by rfl
example : applyReading Phrase.original18 = Phrase.replacement18 := by rfl
example : specReading Phrase.original18 = applyReading Phrase.original18 := agree_spec_impl Phrase.original18
example : sourcePhraseText19 = "第一項又は" := by rfl
example : replacementPhraseText19 = "次条第一項又は" := by rfl
example : applyReading Phrase.original19 = Phrase.replacement19 := by rfl
example : specReading Phrase.original19 = applyReading Phrase.original19 := agree_spec_impl Phrase.original19
example : sourcePhraseText20 = "第一項」とあるのは" := by rfl
example : replacementPhraseText20 = "同条第一項」とあるのは" := by rfl
example : applyReading Phrase.original20 = Phrase.replacement20 := by rfl
example : specReading Phrase.original20 = applyReading Phrase.original20 := agree_spec_impl Phrase.original20
example : sourcePhraseText21 = "第一項」と、" := by rfl
example : replacementPhraseText21 = "次条第一項」と、" := by rfl
example : applyReading Phrase.original21 = Phrase.replacement21 := by rfl
example : specReading Phrase.original21 = applyReading Phrase.original21 := agree_spec_impl Phrase.original21
example : sourcePhraseText22 = "第一項の" := by rfl
example : replacementPhraseText22 = "次条第一項の" := by rfl
example : applyReading Phrase.original22 = Phrase.replacement22 := by rfl
example : specReading Phrase.original22 = applyReading Phrase.original22 := agree_spec_impl Phrase.original22
example : sourcePhraseText23 = "、第五項後段" := by rfl
example : replacementPhraseText23 = "、同条第三項後段" := by rfl
example : applyReading Phrase.original23 = Phrase.replacement23 := by rfl
example : specReading Phrase.original23 = applyReading Phrase.original23 := agree_spec_impl Phrase.original23
example : sourcePhraseText24 = "第一項若しくは第五項後段" := by rfl
example : replacementPhraseText24 = "同条第一項若しくは第三項後段" := by rfl
example : applyReading Phrase.original24 = Phrase.replacement24 := by rfl
example : specReading Phrase.original24 = applyReading Phrase.original24 := agree_spec_impl Phrase.original24
example : sourcePhraseText25 = "第五項後段の規定による組合等届出書" := by rfl
example : replacementPhraseText25 = "同条第三項後段の規定による組合等届出書" := by rfl
example : applyReading Phrase.original25 = Phrase.replacement25 := by rfl
example : specReading Phrase.original25 = applyReading Phrase.original25 := agree_spec_impl Phrase.original25
example : sourcePhraseText26 = "第一項の" := by rfl
example : replacementPhraseText26 = "次条第一項の" := by rfl
example : applyReading Phrase.original26 = Phrase.replacement26 := by rfl
example : specReading Phrase.original26 = applyReading Phrase.original26 := agree_spec_impl Phrase.original26
example : sourcePhraseText27 = "同項、" := by rfl
example : replacementPhraseText27 = "同項、同条第三項及び第八項並びに" := by rfl
example : applyReading Phrase.original27 = Phrase.replacement27 := by rfl
example : specReading Phrase.original27 = applyReading Phrase.original27 := agree_spec_impl Phrase.original27
example : sourcePhraseText28 = "ついては" := by rfl
example : replacementPhraseText28 = "ついては、同条第三項中「の特定振替機関等」とあるのは「の特定受託者」と、同条第八項中「適格口座管理機関又は適格外国仲介業者」とあるのは「第一項に規定する特定受託者又は適格外国仲介業者」と、「当該適格口座管理機関」とあるのは「特定振替機関」とするほか" := by rfl
example : applyReading Phrase.original28 = Phrase.replacement28 := by rfl
example : specReading Phrase.original28 = applyReading Phrase.original28 := agree_spec_impl Phrase.original28
example : sourcePhraseText29 = "第一項当該特定振替機関等" := by rfl
example : replacementPhraseText29 = "次条第一項当該特定振替機関等（" := by rfl
example : applyReading Phrase.original29 = Phrase.replacement29 := by rfl
example : specReading Phrase.original29 = applyReading Phrase.original29 := agree_spec_impl Phrase.original29
example : sourcePhraseText30 = "第十九項" := by rfl
example : replacementPhraseText30 = "前条第十九項" := by rfl
example : applyReading Phrase.original30 = Phrase.replacement30 := by rfl
example : specReading Phrase.original30 = applyReading Phrase.original30 := agree_spec_impl Phrase.original30
example : sourcePhraseText31 = "受託者をいう。以下この条において同じ。）" := by rfl
example : replacementPhraseText31 = "受託者をいい、" := by rfl
example : applyReading Phrase.original31 = Phrase.replacement31 := by rfl
example : specReading Phrase.original31 = applyReading Phrase.original31 := agree_spec_impl Phrase.original31
example : sourcePhraseText32 = "の特定受託者" := by rfl
example : replacementPhraseText32 = "の特定受託者（同項に規定する特定受託者をいう。以下この条において同じ。）" := by rfl
example : applyReading Phrase.original32 = Phrase.replacement32 := by rfl
example : specReading Phrase.original32 = applyReading Phrase.original32 := agree_spec_impl Phrase.original32
example : sourcePhraseText33 = "同条第十九項の規定により読み替えられた同条第一項に規定する特定受託者）」と、第三条の二" := by rfl
example : replacementPhraseText33 = "同条第九項において準用する同法第五条の二第十九項（振替国債等の利子の課税の特例）の規定により読み替えられた同法第五条の三第一項に規定する特定受託者）」と、第三条の二" := by rfl
example : applyReading Phrase.original33 = Phrase.replacement33 := by rfl
example : specReading Phrase.original33 = applyReading Phrase.original33 := agree_spec_impl Phrase.original33
example : sourcePhraseText34 = "同条第十九項の規定により読み替えられた同条第一項に規定する特定受託者）」と、「当該" := by rfl
example : replacementPhraseText34 = "同条第九項において準用する第五条の二第十九項の規定により読み替えられた第五条の三第一項に規定する特定受託者）」と、「当該" := by rfl
example : applyReading Phrase.original34 = Phrase.replacement34 := by rfl
example : specReading Phrase.original34 = applyReading Phrase.original34 := agree_spec_impl Phrase.original34
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead60c35c2841
