import JapanTaxLaw.BatchMultiReadbea5ff23f3Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReadbea5ff23f3

example : sourcePhraseText0 = "第一項の申請書の提出期限までに当該申請書に添付して提出することができない場合" := by rfl
example : replacementPhraseText0 = "次項に規定する提出する日までに同項の物納手続関係書類を提出することができない場合" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReadbea5ff23f3
