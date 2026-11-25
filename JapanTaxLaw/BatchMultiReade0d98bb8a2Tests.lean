import JapanTaxLaw.BatchMultiReade0d98bb8a2Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReade0d98bb8a2

example : sourcePhraseText0 = "規制" := by rfl
example : replacementPhraseText0 = "規制又は会員たる連合会がその会員のする規制について行う調整事業" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "会員たる酒類業組合" := by rfl
example : replacementPhraseText1 = "会員たる酒類業組合又は会員たる連合会の構成員たる酒類業組合" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "会員たる酒類業組合又はその組合員" := by rfl
example : replacementPhraseText2 = "会員たる酒類業組合、会員たる連合会、当該連合会の構成員たる酒類業組合又はこれらの酒類業組合の組合員" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "会員たる酒類業組合に" := by rfl
example : replacementPhraseText3 = "会員たる酒類業組合又は会員たる連合会に" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "会員たる酒類業組合" := by rfl
example : replacementPhraseText4 = "会員たる酒類業組合又は会員たる連合会の構成員たる酒類業組合" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReade0d98bb8a2
