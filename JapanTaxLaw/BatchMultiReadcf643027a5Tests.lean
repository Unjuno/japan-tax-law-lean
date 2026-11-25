import JapanTaxLaw.BatchMultiReadcf643027a5Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiReadcf643027a5

example : sourcePhraseText0 = "設立特定株式の払込みによる取得の後当該取得の日の属する年十二月三十一日まで" := by rfl
example : replacementPhraseText0 = "第九項に規定する適用年の翌年一月一日から同項の適用控除対象設立特定株式の同項に規定する譲渡をした日まで" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "取得後期間" := by rfl
example : replacementPhraseText1 = "譲渡前期間" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "当該設立特定株式" := by rfl
example : replacementPhraseText2 = "当該適用控除対象設立特定株式" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "第三項各号に掲げる数及び前項に規定する取得をした設立特定株式の数" := by rfl
example : replacementPhraseText3 = "第九項第二号イ及びロに定める金額" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "当該分割又は併合の前にされたこれらの規定に規定する取得並びに譲渡及び贈与に係る株式の数" := by rfl
example : replacementPhraseText4 = "同号イ及びロに規定する控除対象設立特定株式数" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "当該取得並びに譲渡及び贈与がされた株式の数" := by rfl
example : replacementPhraseText5 = "当該控除対象設立特定株式数" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "当該取得又は譲渡若しくは贈与がされた後の" := by rfl
example : replacementPhraseText6 = "当該譲渡前期間内における" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "設立特定株式の払込みによる取得後期間内に、当該設立特定株式" := by rfl
example : replacementPhraseText7 = "譲渡前期間内に、第九項の適用控除対象設立特定株式" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "当該設立特定株式と" := by rfl
example : replacementPhraseText8 = "当該適用控除対象設立特定株式と" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "第三項各号に掲げる数及び第四項に規定する取得をした設立特定株式の数" := by rfl
example : replacementPhraseText9 = "第九項第二号イ及びロに定める金額" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "当該株式無償割当ての前にされたこれらの規定に規定する取得並びに譲渡及び贈与に係る株式の数" := by rfl
example : replacementPhraseText10 = "同号イ及びロに規定する控除対象設立特定株式数" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "当該取得並びに譲渡及び贈与がされた株式の数" := by rfl
example : replacementPhraseText11 = "当該控除対象設立特定株式数" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "（取得後期間" := by rfl
example : replacementPhraseText12 = "（譲渡前期間" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "当該取得又は譲渡若しくは贈与がされた後の" := by rfl
example : replacementPhraseText13 = "当該譲渡前期間内における" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiReadcf643027a5
