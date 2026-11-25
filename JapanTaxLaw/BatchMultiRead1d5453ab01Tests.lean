import JapanTaxLaw.BatchMultiRead1d5453ab01Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead1d5453ab01

example : sourcePhraseText0 = "当該譲渡の日の属する年の十二月三十一日までの間" := by rfl
example : replacementPhraseText0 = "次項に規定する取得期限まで" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "から当該譲渡の日の属する年の翌年十二月三十一日までの間" := by rfl
example : replacementPhraseText1 = "の属する年の翌年十二月三十一日まで" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "取得価額以下" := by rfl
example : replacementPhraseText2 = "取得価額とその取得価額の見積額との合計額以下" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "当該取得価額" := by rfl
example : replacementPhraseText3 = "当該合計額" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead1d5453ab01
