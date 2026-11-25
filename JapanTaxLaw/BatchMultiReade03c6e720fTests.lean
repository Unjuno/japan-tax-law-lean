import JapanTaxLaw.BatchMultiReade03c6e720fSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReade03c6e720f

example : sourcePhraseText0 = "又は公開等特定株式に係る雑所得の金額（" := by rfl
example : replacementPhraseText0 = "若しくは公開等特定株式に係る雑所得の金額（" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "又は公開等特定株式に係る譲渡所得の金額" := by rfl
example : replacementPhraseText1 = "若しくは公開等特定株式に係る譲渡所得の金額又は上場株式等に係る事業所得の金額若しくは上場株式等に係る譲渡所得の金額" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "及び公開等特定株式に係る譲渡所得の金額" := by rfl
example : replacementPhraseText2 = "及び公開等特定株式に係る譲渡所得の金額から控除し、なお控除しきれない損失の金額があるときは、上場株式等に係る事業所得の金額及び上場株式等に係る譲渡所得の金額" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReade03c6e720f
