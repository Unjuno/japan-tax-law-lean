import JapanTaxLaw.BatchMultiRead9dcfd22269Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead9dcfd22269

example : sourcePhraseText0 = "同項の事業者" := by rfl
example : replacementPhraseText0 = "第六項の事業者" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "前項の規定" := by rfl
example : replacementPhraseText1 = "第六項の規定" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "一月中間申告対象期間に係る確定日" := by rfl
example : replacementPhraseText2 = "六月中間申告対象期間の末日" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "三月" := by rfl
example : replacementPhraseText3 = "六月" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "割合" := by rfl
example : replacementPhraseText4 = "割合に六を乗じた数" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "一月中間申告対象期間" := by rfl
example : replacementPhraseText5 = "六月中間申告対象期間" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "除して" := by rfl
example : replacementPhraseText6 = "除し、これにその合併の日から当該六月中間申告対象期間の末日までの期間の月数を乗じて" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "同項の事業者" := by rfl
example : replacementPhraseText7 = "第六項の事業者" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "除して" := by rfl
example : replacementPhraseText8 = "除し、これに六を乗じて" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead9dcfd22269
