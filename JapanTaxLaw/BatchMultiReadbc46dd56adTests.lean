import JapanTaxLaw.BatchMultiReadbc46dd56adSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReadbc46dd56ad

example : sourcePhraseText0 = "同条第六項本文（同条第七項の規定により適用する場合を含む。）" := by rfl
example : replacementPhraseText0 = "同条第八項（同条第九項において準用する場合を含む。）" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "同項各号に掲げる場合に該当することとなつた日" := by rfl
example : replacementPhraseText1 = "同条第八項又は第九項に規定する譲渡若しくは決済又は限定相続等による移転の日" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReadbc46dd56ad
