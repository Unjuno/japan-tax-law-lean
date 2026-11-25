import JapanTaxLaw.BatchMultiReadbcdf44351eSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReadbcdf44351e

example : sourcePhraseText0 = "取得した日（" := by rfl
example : replacementPhraseText0 = "取得した日（株式又は出資を取得した日が当該土地の譲渡等をした日の属する年の五年前の年の一月一日前の日である場合には、同年の一月一日。" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReadbcdf44351e
