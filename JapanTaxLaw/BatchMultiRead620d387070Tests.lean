import JapanTaxLaw.BatchMultiRead620d387070Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead620d387070

example : sourcePhraseText0 = "道府県民税若しくは市町村民税の所得割、事業税又は事業所税に係る実質課税額等" := by rfl
example : replacementPhraseText0 = "道府県民税又は市町村民税の法人税割に係る地方団体の徴収金以外の地方団体の徴収金" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "道府県民税又は市町村民税の法人税割に係る実質課税額等" := by rfl
example : replacementPhraseText1 = "道府県民税又は市町村民税の法人税割に係る地方団体の徴収金" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead620d387070
