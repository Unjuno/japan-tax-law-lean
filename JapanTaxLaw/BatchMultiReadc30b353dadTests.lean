import JapanTaxLaw.BatchMultiReadc30b353dadSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReadc30b353dad

example : sourcePhraseText0 = "同号の輸出者若しくは生産者又はこれらの者が所在する協定締約国" := by rfl
example : replacementPhraseText0 = "次条第一項の輸出者又は生産者" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "当該貨物が環太平洋包括的及び先進的協定の規定に基づき環太平洋包括的及び先進的協定の原産品とされるもの" := by rfl
example : replacementPhraseText1 = "関税法、関税定率法その他の関税に関する法律に違反する行為" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReadc30b353dad
