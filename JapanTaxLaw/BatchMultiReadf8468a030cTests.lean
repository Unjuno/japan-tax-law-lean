import JapanTaxLaw.BatchMultiReadf8468a030cSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReadf8468a030c

example : sourcePhraseText0 = "特例適用投資組合契約（同項の規定の適用を受ける非居住者又は外国法人が締結している当該適用に係る投資組合契約をいう。以下この条及び次条において同じ。）" := by rfl
example : replacementPhraseText0 = "投資組合契約（次条第一項に規定する投資組合契約をいう。以下この項において同じ。）" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "当該特例適用投資組合契約" := by rfl
example : replacementPhraseText1 = "当該投資組合契約" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReadf8468a030c
