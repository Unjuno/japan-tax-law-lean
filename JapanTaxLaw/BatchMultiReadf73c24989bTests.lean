import JapanTaxLaw.BatchMultiReadf73c24989bSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReadf73c24989b

example : sourcePhraseText0 = "当該酒類の移出の時" := by rfl
example : replacementPhraseText0 = "当該酒類の移出の時（当該包装を当該酒類と別個に移出する場合には、当該包装の移出の時）" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "方法（当該酒類（財務大臣が定める見本用のものを除く。）の品目については、財務省令で定めるところにより財務大臣に届け出た方法。次項において同じ。）で表示" := by rfl
example : replacementPhraseText1 = "方法で表示" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "内容量" := by rfl
example : replacementPhraseText2 = "当該包装に係る酒類の内容量" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "当該酒類の引取り又は搬出の時" := by rfl
example : replacementPhraseText3 = "当該酒類の引取り又は搬出の時（当該包装を当該酒類と別個に引き取り、又は搬出する場合には、当該包装の引取り又は搬出の時）" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "並びに前項各号" := by rfl
example : replacementPhraseText4 = "、当該包装に係る酒類の内容量（粉末酒にあつては、当該粉末酒の重量）並びに前項第二号から第五号まで" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReadf73c24989b
