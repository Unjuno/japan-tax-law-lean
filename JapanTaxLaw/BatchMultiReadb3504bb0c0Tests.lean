import JapanTaxLaw.BatchMultiReadb3504bb0c0Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReadb3504bb0c0

example : sourcePhraseText0 = "同月において収納すべき航空機燃料税の収入額の見込額" := by rfl
example : replacementPhraseText0 = "同月において収納すべき航空機燃料税の収入額の見込額の五分の四に相当する額" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "五分の四" := by rfl
example : replacementPhraseText1 = "五分の三" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "同月において収納すべき航空機燃料税の収入額の見込額" := by rfl
example : replacementPhraseText2 = "同月において収納すべき航空機燃料税の収入額の見込額の五分の三に相当する額" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "五分の四" := by rfl
example : replacementPhraseText3 = "五分の二" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "同月において収納すべき航空機燃料税の収入額の見込額" := by rfl
example : replacementPhraseText4 = "同月において収納すべき航空機燃料税の収入額の見込額の五分の二に相当する額" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "五分の四" := by rfl
example : replacementPhraseText5 = "五分の一" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "同月において収納すべき航空機燃料税の収入額の見込額" := by rfl
example : replacementPhraseText6 = "同月において収納すべき航空機燃料税の収入額の見込額の五分の一に相当する額" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "収入額と同年の三月において収納すべき航空機燃料税の収入額の見込額の五分の四に相当する額との合算額" := by rfl
example : replacementPhraseText7 = "収入額" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReadb3504bb0c0
