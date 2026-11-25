import JapanTaxLaw.BatchMultiRead6e0fc49325Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead6e0fc49325

example : sourcePhraseText0 = "には、当該内国法人" := by rfl
example : replacementPhraseText0 = "には、当該特定適格組織再編成等により設立された内国法人" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "当該内国法人が当該支配関係法人" := by rfl
example : replacementPhraseText1 = "第三項に規定する被合併法人等が他の被合併法人等" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "同項の支配関係法人から特定適格組織再編成等" := by rfl
example : replacementPhraseText2 = "特定適格組織再編成等に係る次項に規定する被合併法人等（次号に規定する他の被合併法人等を除く。）から当該特定適格組織再編成等" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "当該支配関係法人が当該内国法人" := by rfl
example : replacementPhraseText3 = "当該被合併法人等が当該他の被合併法人等" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "有する資産（棚卸資産、" := by rfl
example : replacementPhraseText4 = "特定適格組織再編成等に係る次項に規定する他の被合併法人等から当該特定適格組織再編成等により移転を受けた資産（棚卸資産、当該" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "の属する事業年度開始の日における" := by rfl
example : replacementPhraseText5 = "における" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "支配関係発生日" := by rfl
example : replacementPhraseText6 = "当該他の被合併法人等が支配関係発生日" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead6e0fc49325
