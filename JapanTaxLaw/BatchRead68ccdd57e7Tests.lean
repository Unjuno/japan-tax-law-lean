import JapanTaxLaw.BatchRead68ccdd57e7Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchRead68ccdd57e7

example : sourcePhraseText = "当該各号に規定する貸付け又は譲渡しの条件に従つて譲り渡すことができることとなつた日" := by rfl
example : replacementPhraseText = "租税特別措置法及び国税収納金整理資金に関する法律の一部を改正する法律（昭和五十三年法律第十一号）の施行の日" := by rfl
example : applyReading Phrase.original = Phrase.replacement := by rfl
example : applyReading Phrase.replacement = Phrase.replacement := by rfl
example : applyReading Phrase.other = Phrase.other := by rfl
example : applyWhen false Phrase.original = Phrase.original := by rfl
example : applyWhen false Phrase.replacement = Phrase.replacement := by rfl
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

example : specReading Phrase.original = applyReading Phrase.original := agree_spec_impl Phrase.original
example : specReading Phrase.replacement = applyReading Phrase.replacement := agree_spec_impl Phrase.replacement
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : specWhen true Phrase.original = applyWhen true Phrase.original := agree_when_spec_impl true Phrase.original
example : specWhen false Phrase.original = applyWhen false Phrase.original := agree_when_spec_impl false Phrase.original

end JapanTaxLaw.BatchRead68ccdd57e7
