import JapanTaxLaw.BatchMultiRead47ab1428a1Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead47ab1428a1

example : sourcePhraseText0 = "当該不当廉売関税の課税の回避に係る調査により判明した事実及びこれにより得られた結論" := by rfl
example : replacementPhraseText0 = "当該不当廉売関税の課税の回避に係る調査を取りやめるまでに判明した事実及び当該不当廉売関税の課税の回避に係る調査を取りやめる理由" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead47ab1428a1
