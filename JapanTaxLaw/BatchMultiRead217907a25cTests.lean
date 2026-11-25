import JapanTaxLaw.BatchMultiRead217907a25cSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead217907a25c

example : sourcePhraseText0 = "同項の保険会社等" := by rfl
example : replacementPhraseText0 = "判定対象内国法人等（同項第一号ロに規定する判定対象内国法人等をいう。以下この項及び次項において同じ。）" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "内国法人" := by rfl
example : replacementPhraseText1 = "外国関係会社" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "当該保険会社等" := by rfl
example : replacementPhraseText2 = "当該判定対象内国法人等" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "内国法人の法人税法" := by rfl
example : replacementPhraseText3 = "外国関係会社の法人税法" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "他の内国法人" := by rfl
example : replacementPhraseText4 = "外国法人" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "株主内国法人" := by rfl
example : replacementPhraseText5 = "株主外国法人" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "全部" := by rfl
example : replacementPhraseText6 = "百分の五十を超える数又は金額の株式等" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "保険会社等" := by rfl
example : replacementPhraseText7 = "判定対象内国法人等" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "当該内国法人" := by rfl
example : replacementPhraseText8 = "当該外国関係会社" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "内国法人に係る" := by rfl
example : replacementPhraseText9 = "外国関係会社に係る" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "株主内国法人" := by rfl
example : replacementPhraseText10 = "株主外国法人" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "保険会社等" := by rfl
example : replacementPhraseText11 = "判定対象内国法人等" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "の内国法人" := by rfl
example : replacementPhraseText12 = "の外国法人" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "出資関連内国法人" := by rfl
example : replacementPhraseText13 = "出資関連外国法人" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : sourcePhraseText14 = "全部" := by rfl
example : replacementPhraseText14 = "百分の五十を超える数又は金額の株式等" := by rfl
example : applyReading Phrase.original14 = Phrase.replacement14 := by rfl
example : specReading Phrase.original14 = applyReading Phrase.original14 := agree_spec_impl Phrase.original14
example : sourcePhraseText15 = "当該内国法人" := by rfl
example : replacementPhraseText15 = "当該外国関係会社" := by rfl
example : applyReading Phrase.original15 = Phrase.replacement15 := by rfl
example : specReading Phrase.original15 = applyReading Phrase.original15 := agree_spec_impl Phrase.original15
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead217907a25c
