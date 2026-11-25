import JapanTaxLaw.BatchMultiRead26dae1c2b8Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead26dae1c2b8

example : sourcePhraseText0 = "発行済株式等に" := by rfl
example : replacementPhraseText0 = "株式等の請求権に基づき受けることができる剰余金の配当等（第二項第二号に規定する剰余金の配当等をいう。以下この項において同じ。）の総額に" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "株式等の数又は金額と" := by rfl
example : replacementPhraseText1 = "剰余金の配当等の額と" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "発行済株式等の全部" := by rfl
example : replacementPhraseText2 = "株式等の請求権の全部" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "持株割合" := by rfl
example : replacementPhraseText3 = "請求権割合" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "数又は金額が当該株式等の発行法人の発行済株式等" := by rfl
example : replacementPhraseText4 = "請求権に基づき受けることができる剰余金の配当等の額がその総額" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "発行法人と" := by rfl
example : replacementPhraseText5 = "請求権に係る株式等の発行法人と" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "発行済株式等" := by rfl
example : replacementPhraseText6 = "株式等の請求権" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "保有を" := by rfl
example : replacementPhraseText7 = "請求権の保有を" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "持株割合" := by rfl
example : replacementPhraseText8 = "請求権割合" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead26dae1c2b8
