import JapanTaxLaw.BatchTableRead64eeea5ca8Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead64eeea5ca8

example : sourcePhraseText0 = "読み替えられる字句" := by rfl
example : replacementPhraseText0 = "読み替える字句" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "当該申立てに係る貨物についての認定手続が終了するまでの間当該貨物が輸入されないことにより" := by rfl
example : replacementPhraseText1 = "当該見本に係る疑義貨物が第六十九条の十一第一項第九号に掲げる貨物又は同項第九号の二若しくは第十号に掲げる貨物に該当する貨物と認定されなかつた場合に" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "申立てをした者（以下この条において「申立人" := by rfl
example : replacementPhraseText2 = "承認の申請をした者（以下この条において「申請者" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "申立人" := by rfl
example : replacementPhraseText3 = "申請者" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "認定手続を取りやめる" := by rfl
example : replacementPhraseText4 = "次条第二項の承認をしない" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead64eeea5ca8
