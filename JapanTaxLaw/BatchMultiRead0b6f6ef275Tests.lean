import JapanTaxLaw.BatchMultiRead0b6f6ef275Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead0b6f6ef275

example : sourcePhraseText0 = "採掘所得金額は" := by rfl
example : replacementPhraseText0 = "第十一項に規定する残額（以下第七項までにおいて「海外採掘所得金額" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "前項の" := by rfl
example : replacementPhraseText1 = "第十一項の" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "当該採掘所得金額" := by rfl
example : replacementPhraseText2 = "当該海外採掘所得金額" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "前項" := by rfl
example : replacementPhraseText3 = "第十一項" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "採掘所得金額" := by rfl
example : replacementPhraseText4 = "海外採掘所得金額" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "採掘所得金額" := by rfl
example : replacementPhraseText5 = "海外採掘所得金額" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "前二項" := by rfl
example : replacementPhraseText6 = "前項及び第十一項" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "採掘所得金額" := by rfl
example : replacementPhraseText7 = "海外採掘所得金額" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead0b6f6ef275
