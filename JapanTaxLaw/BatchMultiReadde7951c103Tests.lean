import JapanTaxLaw.BatchMultiReadde7951c103Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReadde7951c103

example : sourcePhraseText0 = "当該公益目的事業の用" := by rfl
example : replacementPhraseText0 = "当該公益目的事業の用（政令で定める事業の用に限る。）" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "とし、第二号の書類を提出した公益法人等は、同号の特定買換資産を、同号の方法により管理しなければならないものとする" := by rfl
example : replacementPhraseText1 = "とする" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReadde7951c103
