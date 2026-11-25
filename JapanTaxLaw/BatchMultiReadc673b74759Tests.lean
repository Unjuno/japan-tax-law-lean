import JapanTaxLaw.BatchMultiReadc673b74759Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReadc673b74759

example : sourcePhraseText0 = "確定申告書の提出と同時に" := by rfl
example : replacementPhraseText0 = "事実が生じた日以後一年以内に" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "請求することができる。" := by rfl
example : replacementPhraseText1 = "請求することができる。ただし、還付所得事業年度から欠損事業年度までの各事業年度について連続して青色申告書である確定申告書を提出している場合に限る。" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReadc673b74759
