import JapanTaxLaw.BatchMultiRead7148a05c7bSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead7148a05c7b

example : sourcePhraseText0 = "前項の場合" := by rfl
example : replacementPhraseText0 = "第十五項又は第十六項において準用する前項の場合" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "同項の移管元の" := by rfl
example : replacementPhraseText1 = "第十七項に規定する移管元の営業所の長又は同項に規定する移管元の" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "、前項の" := by rfl
example : replacementPhraseText2 = "、第十五項又は第十六項において準用する前項の" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "当該移管先の金融商品取引業者等の営業所の長" := by rfl
example : replacementPhraseText3 = "当該移管先の営業所の長又は移管先の金融商品取引業者等の営業所の長" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "ない場合" := by rfl
example : replacementPhraseText4 = "ない場合その他財務省令で定める場合" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "同項の特定口座内保管上場株式等" := by rfl
example : replacementPhraseText5 = "第十五項又は第十六項において準用する前項に規定する相続上場株式等（以下この項において「相続上場株式等" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "前項の" := by rfl
example : replacementPhraseText6 = "第十五項又は第十六項において準用する前項の" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "特定口座内保管上場株式等移管依頼書" := by rfl
example : replacementPhraseText7 = "相続上場株式等移管依頼書" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "特定口座内保管上場株式等" := by rfl
example : replacementPhraseText8 = "相続上場株式等" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "移管元の金融商品取引業者等の営業所の長" := by rfl
example : replacementPhraseText9 = "移管元の営業所の長又は移管元の金融商品取引業者等の営業所の長" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "直前に移管元の特定口座" := by rfl
example : replacementPhraseText10 = "直前に第十五項又は第十六項において準用する前項に規定する相続等口座（以下この項において「相続等口座" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "当該移管元の特定口座" := by rfl
example : replacementPhraseText11 = "当該相続等口座" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "移管が移管元の特定口座" := by rfl
example : replacementPhraseText12 = "移管が相続等口座" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "、当該移管が" := by rfl
example : replacementPhraseText13 = "、当該居住者又は恒久的施設を有する非居住者が取得した相続上場株式等のうち移管が" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead7148a05c7b
