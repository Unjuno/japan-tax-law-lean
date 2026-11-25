import JapanTaxLaw.BatchTableReadff3bc3c9abSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableReadff3bc3c9ab

example : sourcePhraseText0 = "前二条基準年度に係る賦課期日における価格又は第三百四十九条第二項ただし書、第三項ただし書、第四項、第五項ただし書若しくは第六項の規定により当該価格に比準するものとされる価格" := by rfl
example : replacementPhraseText0 = "附則第十七条の二第一項同条第一項に規定する修正価格（以下「修正価格」という。）" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "前二条" := by rfl
example : replacementPhraseText1 = "附則第十七条の二第一項" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "第三百四十九条" := by rfl
example : replacementPhraseText2 = "附則第十七条の二第一項" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "土地及び家屋にあつては基準年度の価格又は第三百四十九条第二項ただし書、第三項ただし書、第四項、第五項ただし書若しくは第六項の規定により当該価格に比準するものとされる価格（以下「比準価格」と総称する。）" := by rfl
example : replacementPhraseText3 = "土地にあつては修正価格" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "基準年度の価格又は比準価格" := by rfl
example : replacementPhraseText4 = "修正価格" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "固定資産評価基準" := by rfl
example : replacementPhraseText5 = "固定資産評価基準及び附則第十七条の二第一項に規定する修正基準" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "土地及び家屋の基準年度の価格又は比準価格その基準年度の価格又は比準価格" := by rfl
example : replacementPhraseText6 = "土地の修正価格その修正価格" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "は、第三百四十九条" := by rfl
example : replacementPhraseText7 = "は、附則第十七条の二第一項" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableReadff3bc3c9ab
