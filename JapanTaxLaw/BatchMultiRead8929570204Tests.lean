import JapanTaxLaw.BatchMultiRead8929570204Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead8929570204

example : sourcePhraseText0 = "同項の事業者" := by rfl
example : replacementPhraseText0 = "第四項の事業者" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "前項の規定" := by rfl
example : replacementPhraseText1 = "第四項の規定" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "一月中間申告対象期間に係る確定日" := by rfl
example : replacementPhraseText2 = "三月中間申告対象期間の末日" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "割合" := by rfl
example : replacementPhraseText3 = "割合に三を乗じた数" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "一月中間申告対象期間" := by rfl
example : replacementPhraseText4 = "三月中間申告対象期間" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "除して" := by rfl
example : replacementPhraseText5 = "除し、これにその合併の日から当該三月中間申告対象期間の末日までの期間の月数（当該月数が三を超えるときは、三）を乗じて" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "同項の事業者" := by rfl
example : replacementPhraseText6 = "第四項の事業者" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "除して" := by rfl
example : replacementPhraseText7 = "除し、これに三を乗じて" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead8929570204
