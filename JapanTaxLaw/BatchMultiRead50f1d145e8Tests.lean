import JapanTaxLaw.BatchMultiRead50f1d145e8Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead50f1d145e8

example : sourcePhraseText0 = "前年度の四月一日" := by rfl
example : replacementPhraseText0 = "前々年度の四月一日" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "当該実人員の合計数が、前々年度" := by rfl
example : replacementPhraseText1 = "前年度の密度の算定において前々々年度" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "得た数に満たないときは、当該〇・九を乗じて得た数とする。この場合において表示単位未満の端数があるときは、その端数を四捨五入する。" := by rfl
example : replacementPhraseText2 = "得た数を前々年度の四月一日から三月三十一日までの間における生活扶助者数として用いた場合にあつては、当該用いた数とする。" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "別表第二の二" := by rfl
example : replacementPhraseText3 = "別表第二の四" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "前年度中" := by rfl
example : replacementPhraseText4 = "前々年度中" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead50f1d145e8
