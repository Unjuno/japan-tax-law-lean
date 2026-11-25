import JapanTaxLaw.BatchMultiReade21ce95202Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReade21ce95202

example : sourcePhraseText0 = "外国関係会社（同条第二項第一号に規定する外国関係会社をいう。以下この項において同じ。）" := by rfl
example : replacementPhraseText0 = "外国法人" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "外国関係会社" := by rfl
example : replacementPhraseText1 = "外国法人" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "居住者等" := by rfl
example : replacementPhraseText2 = "一の居住者" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "いい、当該発行法人と居住者又は内国法人との間に実質支配関係がある場合には、零とする" := by rfl
example : replacementPhraseText3 = "いう" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "外国関係会社" := by rfl
example : replacementPhraseText4 = "外国法人" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "居住者等" := by rfl
example : replacementPhraseText5 = "一の居住者" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReade21ce95202
