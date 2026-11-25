import JapanTaxLaw.BatchTableRead01ccfc3c8cSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead01ccfc3c8c

example : sourcePhraseText0 = "の各事業年度（以下この項から第四十六項までにおいて「対象事業年度」という。）において、過去適用事業年度（当該対象事業年度" := by rfl
example : replacementPhraseText0 = "が公益法人等に該当することとなつた場合において、その該当することとなつた日以後に、過去適用事業年度（最終事業年度（その該当することとなつた日の前日の属する事業年度をいう。以下この項及び次項において同じ。）" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "税額控除額（当該対象事業年度" := by rfl
example : replacementPhraseText1 = "税額控除額（当該最終事業年度" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "超える場合には" := by rfl
example : replacementPhraseText2 = "超えるときは" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "を当該対象事業年度" := by rfl
example : replacementPhraseText3 = "を当該最終事業年度" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "の対象事業年度において" := by rfl
example : replacementPhraseText4 = "が第二十四条第五項に規定する公益法人等に該当することとなつた場合において、その該当することとなつた日以後に" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "場合には、当該対象事業年度" := by rfl
example : replacementPhraseText5 = "ときは、最終事業年度" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead01ccfc3c8c
