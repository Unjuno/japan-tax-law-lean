import JapanTaxLaw.BatchMultiRead0361342fdfSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead0361342fdf

example : sourcePhraseText0 = "同項" := by rfl
example : replacementPhraseText0 = "第一項" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "貸付期限から" := by rfl
example : replacementPhraseText1 = "耕作の放棄があつた日から" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "貸付期限が到来した" := by rfl
example : replacementPhraseText2 = "耕作の放棄があつた" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "部分については、" := by rfl
example : replacementPhraseText3 = "部分又は当該猶予適用者の農業の用に供した部分については、耕作の放棄及び" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "貸付期限" := by rfl
example : replacementPhraseText4 = "耕作の放棄があつた日" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "については" := by rfl
example : replacementPhraseText5 = "については、当該耕作の放棄はなかつたものとみなし" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "貸付期限" := by rfl
example : replacementPhraseText6 = "耕作の放棄があつた日" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "貸付期限（" := by rfl
example : replacementPhraseText7 = "耕作の放棄があつた日（" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "賃借権等の設定" := by rfl
example : replacementPhraseText8 = "耕作の放棄" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "貸付期限から" := by rfl
example : replacementPhraseText9 = "耕作の放棄があつた日から" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "貸付期限が到来した" := by rfl
example : replacementPhraseText10 = "耕作の放棄があつた" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "貸付期限" := by rfl
example : replacementPhraseText11 = "耕作の放棄があつた日" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead0361342fdf
