import JapanTaxLaw.BatchTableReadef998a3c20Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableReadef998a3c20

example : sourcePhraseText0 = "前二条基準年度に係る賦課期日における価格又は第三百四十九条第二項ただし書、第三項ただし書、第四項、第五項ただし書若しくは第六項の規定により当該価格に比準するものとされる価格" := by rfl
example : replacementPhraseText0 = "附則第十七条の二第一項又は第二項同条第一項に規定する修正価格（以下「修正価格」という。）又は同条第二項に規定する修正された価格（以下「修正された価格」という。）" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "前二条" := by rfl
example : replacementPhraseText1 = "附則第十七条の二第一項又は第二項" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "第三百四十九条" := by rfl
example : replacementPhraseText2 = "附則第十七条の二第一項又は第二項" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "土地及び家屋にあつては基準年度の価格又は第三百四十九条第二項ただし書、第三項ただし書、第四項、第五項ただし書若しくは第六項の規定により当該価格に比準するものとされる価格（以下「比準価格」と総称する。）" := by rfl
example : replacementPhraseText3 = "土地にあつては修正価格又は修正された価格" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "基準年度の価格又は比準価格" := by rfl
example : replacementPhraseText4 = "修正価格又は修正された価格" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "固定資産評価基準" := by rfl
example : replacementPhraseText5 = "固定資産評価基準及び附則第十七条の二第一項に規定する修正基準" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "第二年度又は第三年度において基準年度の土地又は家屋" := by rfl
example : replacementPhraseText6 = "令和八年度において附則第十七条の二第一項に規定する令和六年度の土地又は令和七年度の土地" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "基準年度の価格による" := by rfl
example : replacementPhraseText7 = "令和七年度分の固定資産税の課税標準の基礎となつた価格による" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "土地課税台帳等又は家屋課税台帳等に登録されている基準年度の価格" := by rfl
example : replacementPhraseText8 = "土地課税台帳等に登録されている令和七年度分の固定資産税の課税標準の基礎となつた価格" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "第二年度又は第三年度において土地課税台帳等又は家屋課税台帳等" := by rfl
example : replacementPhraseText9 = "令和八年度において土地課税台帳等" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "みなし、第三年度において基準年度の土地若しくは家屋又は第二年度の土地若しくは家屋に対して課する固定資産税の課税標準について比準価格による場合にあつては、土地課税台帳等又は家屋課税台帳等に登録されている当該比準価格をもつて第三年度において土地課税台帳等又は家屋課税台帳等に登録された比準価格とみなす" := by rfl
example : replacementPhraseText10 = "みなす" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "固定資産評価基準" := by rfl
example : replacementPhraseText11 = "固定資産評価基準及び附則第十七条の二第一項に規定する修正基準" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "土地及び家屋の基準年度の価格又は比準価格" := by rfl
example : replacementPhraseText12 = "土地の修正価格又は修正された価格" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "その基準年度の価格又は比準価格" := by rfl
example : replacementPhraseText13 = "その修正価格又は修正された価格" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : sourcePhraseText14 = "当該土地又は家屋について第三百四十九条第二項第一号に掲げる事情があるため同条同項ただし書、第三項ただし書又は第五項ただし書の規定の適用を受けるべきものであること" := by rfl
example : replacementPhraseText14 = "当該土地が附則第十七条の二第二項に規定する令和七年度適用土地（以下「令和七年度適用土地」という。）であつて当該令和七年度適用土地について令和八年度に係る賦課期日において第三百四十九条第二項第一号に掲げる事情があるため附則第十七条の二第二項の規定により当該令和七年度適用土地の類似土地（附則第十七条第七号に規定する類似土地をいう。以下同じ。）に係る令和七年度分の固定資産税の課税標準の基礎となつた価格に比準する価格によるべきものであること、若しくは当該土地が同項に規定する令和七年度類似適用土地（以下「令和七年度類似適用土地」という。）であつて当該令和七年度類似適用土地について令和八年度に係る賦課期日において第三百四十九条第二項第一号に掲げる事情があるため附則第十七条の二第二項の規定により当該令和七年度類似適用土地の類似土地に係る令和七年度分の固定資産税の課税標準の基礎となつた価格に比準する価格によるべきものであること、又は令和八年度分の固定資産税について当該土地が同条第一項の規定の適用を受けるべきものであること" := by rfl
example : applyReading Phrase.original14 = Phrase.replacement14 := by rfl
example : specReading Phrase.original14 = applyReading Phrase.original14 := agree_spec_impl Phrase.original14
example : sourcePhraseText15 = "は、第三百四十九条" := by rfl
example : replacementPhraseText15 = "は、附則第十七条の二第一項若しくは第二項" := by rfl
example : applyReading Phrase.original15 = Phrase.replacement15 := by rfl
example : specReading Phrase.original15 = applyReading Phrase.original15 := agree_spec_impl Phrase.original15
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableReadef998a3c20
