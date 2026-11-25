import JapanTaxLaw.BatchMultiRead324b82b9edSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead324b82b9ed

example : sourcePhraseText0 = "欠損金額に係る事業年度" := by rfl
example : replacementPhraseText0 = "災害損失欠損金額（第十一項に規定する災害損失欠損金額をいう。以下第八項までにおいて同じ。）に係る事業年度又は中間期間" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "前一年" := by rfl
example : replacementPhraseText1 = "前一年（当該欠損事業年度に係る確定申告書又は仮決算の中間申告書が青色申告書である場合には、前二年）" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "欠損金額に係る事業年度" := by rfl
example : replacementPhraseText2 = "災害損失欠損金額に係る事業年度又は中間期間" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "前一年" := by rfl
example : replacementPhraseText3 = "前一年（当該欠損事業年度に係る確定申告書又は仮決算の中間申告書が青色申告書である場合には、前二年）" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "当該確定申告書" := by rfl
example : replacementPhraseText4 = "当該各事業年度に係る確定申告書又は当該中間期間に係る仮決算の中間申告書" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "欠損金額に係る事業年度" := by rfl
example : replacementPhraseText5 = "災害損失欠損金額に係る事業年度又は中間期間" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "前一年" := by rfl
example : replacementPhraseText6 = "前一年（当該欠損事業年度に係る確定申告書又は仮決算の中間申告書が青色申告書である場合には、前二年）" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "連続して青色申告書である" := by rfl
example : replacementPhraseText7 = "連続して" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "連続して青色申告書である" := by rfl
example : replacementPhraseText8 = "連続して" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead324b82b9ed
