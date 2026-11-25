import JapanTaxLaw.BatchMultiRead4fab3d0404Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead4fab3d0404

example : sourcePhraseText0 = "前項の他方の法人" := by rfl
example : replacementPhraseText0 = "他の内国法人" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "である法人" := by rfl
example : replacementPhraseText1 = "である内国法人" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "百分の五十以上の" := by rfl
example : replacementPhraseText2 = "百分の五十を超える" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "同項の一方の法人" := by rfl
example : replacementPhraseText3 = "一の内国法人" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "当該他方の法人" := by rfl
example : replacementPhraseText4 = "当該他の内国法人" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "前項の他方の法人" := by rfl
example : replacementPhraseText5 = "他の内国法人" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "である法人" := by rfl
example : replacementPhraseText6 = "である内国法人" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "同項の一方の法人" := by rfl
example : replacementPhraseText7 = "一の内国法人" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "以上の法人" := by rfl
example : replacementPhraseText8 = "以上の内国法人" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "百分の五十以上の" := by rfl
example : replacementPhraseText9 = "百分の五十を超える" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "当該一方の法人" := by rfl
example : replacementPhraseText10 = "当該一の内国法人" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "当該他方の法人" := by rfl
example : replacementPhraseText11 = "当該他の内国法人" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead4fab3d0404
