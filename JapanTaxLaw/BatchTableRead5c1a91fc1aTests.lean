import JapanTaxLaw.BatchTableRead5c1a91fc1aSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead5c1a91fc1a

example : sourcePhraseText0 = "道府県知事" := by rfl
example : replacementPhraseText0 = "市町村長" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "第五十五条第一項当該道府県民税" := by rfl
example : replacementPhraseText1 = "第三百二十一条の十一第一項当該市町村民税" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "第五十五条第二項" := by rfl
example : replacementPhraseText2 = "第三百二十一条の十一第二項" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "道府県内" := by rfl
example : replacementPhraseText3 = "市町村内" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "第五十三条第一項" := by rfl
example : replacementPhraseText4 = "第三百二十一条の八第一項" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "道府県民税に" := by rfl
example : replacementPhraseText5 = "市町村民税に" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "道府県民税額" := by rfl
example : replacementPhraseText6 = "市町村民税額" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "道府県知事" := by rfl
example : replacementPhraseText7 = "市町村長" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "道府県知事" := by rfl
example : replacementPhraseText8 = "市町村長" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "道府県知事" := by rfl
example : replacementPhraseText9 = "市町村長" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "第五十六条第二項又は第六十四条" := by rfl
example : replacementPhraseText10 = "第三百二十一条の十二第二項又は第三百二十六条" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "第五十三条第一項" := by rfl
example : replacementPhraseText11 = "第三百二十一条の八第一項" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "道府県民税額" := by rfl
example : replacementPhraseText12 = "市町村民税額" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "道府県民税額第五十三条第三十四項" := by rfl
example : replacementPhraseText13 = "市町村民税額第三百二十一条の八第三十四項" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : sourcePhraseText14 = "第五十六条" := by rfl
example : replacementPhraseText14 = "第三百二十一条の十二" := by rfl
example : applyReading Phrase.original14 = Phrase.replacement14 := by rfl
example : specReading Phrase.original14 = applyReading Phrase.original14 := agree_spec_impl Phrase.original14
example : sourcePhraseText15 = "道府県知事" := by rfl
example : replacementPhraseText15 = "市町村長" := by rfl
example : applyReading Phrase.original15 = Phrase.replacement15 := by rfl
example : specReading Phrase.original15 = applyReading Phrase.original15 := agree_spec_impl Phrase.original15
example : sourcePhraseText16 = "第五十三条第一項又は" := by rfl
example : replacementPhraseText16 = "第三百二十一条の八第一項又は" := by rfl
example : applyReading Phrase.original16 = Phrase.replacement16 := by rfl
example : specReading Phrase.original16 = applyReading Phrase.original16 := agree_spec_impl Phrase.original16
example : sourcePhraseText17 = "道府県民税の法第五十三条第一項の規定による申告書の提出期限後" := by rfl
example : replacementPhraseText17 = "市町村民税の法第三百二十一条の八第一項の規定による申告書の提出期限後" := by rfl
example : applyReading Phrase.original17 = Phrase.replacement17 := by rfl
example : specReading Phrase.original17 = applyReading Phrase.original17 := agree_spec_impl Phrase.original17
example : sourcePhraseText18 = "第五十五条第二項道府県民税の法第五十三条第一項" := by rfl
example : replacementPhraseText18 = "第三百二十一条の十一第二項市町村民税の法第三百二十一条の八第一項" := by rfl
example : applyReading Phrase.original18 = Phrase.replacement18 := by rfl
example : specReading Phrase.original18 = applyReading Phrase.original18 := agree_spec_impl Phrase.original18
example : sourcePhraseText19 = "道府県民税の法第五十三条第一項" := by rfl
example : replacementPhraseText19 = "市町村民税の法第三百二十一条の八第一項" := by rfl
example : applyReading Phrase.original19 = Phrase.replacement19 := by rfl
example : specReading Phrase.original19 = applyReading Phrase.original19 := agree_spec_impl Phrase.original19
example : sourcePhraseText20 = "第五十五条第二項" := by rfl
example : replacementPhraseText20 = "第三百二十一条の十一第二項" := by rfl
example : applyReading Phrase.original20 = Phrase.replacement20 := by rfl
example : specReading Phrase.original20 = applyReading Phrase.original20 := agree_spec_impl Phrase.original20
example : sourcePhraseText21 = "道府県知事" := by rfl
example : replacementPhraseText21 = "市町村長" := by rfl
example : applyReading Phrase.original21 = Phrase.replacement21 := by rfl
example : specReading Phrase.original21 = applyReading Phrase.original21 := agree_spec_impl Phrase.original21
example : sourcePhraseText22 = "道府県民税で" := by rfl
example : replacementPhraseText22 = "市町村民税で" := by rfl
example : applyReading Phrase.original22 = Phrase.replacement22 := by rfl
example : specReading Phrase.original22 = applyReading Phrase.original22 := agree_spec_impl Phrase.original22
example : sourcePhraseText23 = "道府県民税額" := by rfl
example : replacementPhraseText23 = "市町村民税額" := by rfl
example : applyReading Phrase.original23 = Phrase.replacement23 := by rfl
example : specReading Phrase.original23 = applyReading Phrase.original23 := agree_spec_impl Phrase.original23
example : sourcePhraseText24 = "道府県知事" := by rfl
example : replacementPhraseText24 = "市町村長" := by rfl
example : applyReading Phrase.original24 = Phrase.replacement24 := by rfl
example : specReading Phrase.original24 = applyReading Phrase.original24 := agree_spec_impl Phrase.original24
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead5c1a91fc1a
