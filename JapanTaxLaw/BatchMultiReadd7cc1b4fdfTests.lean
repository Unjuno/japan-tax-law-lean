import JapanTaxLaw.BatchMultiReadd7cc1b4fdfSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReadd7cc1b4fdf

example : sourcePhraseText0 = "主たる事務所の所在地" := by rfl
example : replacementPhraseText0 = "本店又は主たる事務所の所在地（当該引継法人等が個人である場合には、当該引継法人等の納税地）" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "主たる事務所の所在地" := by rfl
example : replacementPhraseText1 = "本店又は主たる事務所の所在地（当該受贈公益法人等が個人である場合には、当該受贈公益法人等の納税地）" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "主たる事務所の所在地" := by rfl
example : replacementPhraseText2 = "本店又は主たる事務所の所在地（当該引継受託者が個人である場合には、当該引継受託者の納税地）" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReadd7cc1b4fdf
