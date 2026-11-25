import JapanTaxLaw.BatchTableReadc3aaaf884bSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableReadc3aaaf884b

example : sourcePhraseText0 = "前項に平成二十八年五月二日" := by rfl
example : replacementPhraseText0 = "第十三項に令和元年十月三十一日" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "前項" := by rfl
example : replacementPhraseText1 = "第十三項" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "第三項附則第十二条第四項附則第五十二条第二項" := by rfl
example : replacementPhraseText2 = "第十三項附則第十二条第十四項において準用する同条第四項附則第五十二条第十三項において準用する同条第二項" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "平成二十八年九月三十日" := by rfl
example : replacementPhraseText3 = "令和二年三月三十一日" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "第三項同項" := by rfl
example : replacementPhraseText4 = "第十三項同項及び第四項" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "附則第二十条第四項" := by rfl
example : replacementPhraseText5 = "附則第二十条第十四項において準用する同条第四項" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "附則第二十条第四項平成二十八年五月二日" := by rfl
example : replacementPhraseText6 = "附則第二十条第十四項において準用する同条第四項令和元年十月三十一日" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "附則第二十条第四項" := by rfl
example : replacementPhraseText7 = "附則第二十条第十四項において準用する同条第四項" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "平成二十八年九月三十日" := by rfl
example : replacementPhraseText8 = "令和二年三月三十一日" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "附則第二十条第六項" := by rfl
example : replacementPhraseText9 = "附則第二十条第十四項において準用する同条第六項" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "第三項" := by rfl
example : replacementPhraseText10 = "第十三項" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableReadc3aaaf884b
