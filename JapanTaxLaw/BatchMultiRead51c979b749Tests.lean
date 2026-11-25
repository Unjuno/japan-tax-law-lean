import JapanTaxLaw.BatchMultiRead51c979b749Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead51c979b749

example : sourcePhraseText0 = "欠損金額に係る事業年度" := by rfl
example : replacementPhraseText0 = "災害損失欠損金額（第五項に規定する災害損失欠損金額をいう。以下この項及び第三項において同じ。）に係る事業年度又は中間期間" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "前一年" := by rfl
example : replacementPhraseText1 = "前一年（当該欠損事業年度に係る確定申告書又は仮決算の中間申告書が青色申告書である場合には、前二年）" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "欠損金額（第五項において準用するこの項の規定により当該還付所得事業年度の所得に対する法人税の額につき還付を受ける金額の計算の基礎とするもの及び" := by rfl
example : replacementPhraseText2 = "災害損失欠損金額（" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "連続して青色申告書である" := by rfl
example : replacementPhraseText3 = "連続して" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead51c979b749
