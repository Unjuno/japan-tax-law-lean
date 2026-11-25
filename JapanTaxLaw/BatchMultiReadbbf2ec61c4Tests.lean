import JapanTaxLaw.BatchMultiReadbbf2ec61c4Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReadbbf2ec61c4

example : sourcePhraseText0 = "氏名又は名称及び国外にある住所若しくは居所又は本店若しくは主たる事務所" := by rfl
example : replacementPhraseText0 = "名称及び本店又は主たる事務所" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "非居住者又は外国法人" := by rfl
example : replacementPhraseText1 = "非居住者若しくは外国法人又は次項に規定する国内金融機関等" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "内国法人" := by rfl
example : replacementPhraseText2 = "内国法人（次項に規定する国内金融機関等を除く。）" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "外国法人" := by rfl
example : replacementPhraseText3 = "外国法人並びに同項に規定する国内金融機関等" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReadbbf2ec61c4
