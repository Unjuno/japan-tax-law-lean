import JapanTaxLaw.BatchTableRead5775cf7499Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead5775cf7499

example : sourcePhraseText0 = "平成六年度平成五年度に" := by rfl
example : replacementPhraseText0 = "市街化区域設定年度（都市計画法及び建築基準法の一部を改正する法律（平成十二年法律第七十三号）第一条の規定による改正前の都市計画法第七条第一項に規定する市街化区域及び市街化調整区域に関する都市計画又は都市計画法第七条第一項に規定する区域区分に関する都市計画が当該市町村の区域について定められたことその他の政令で定める事由の生じた日の属する年の翌年の一月一日（当該政令で定める事由の生じた日が一月一日である場合には、同日）を賦課期日とする年度をいう。以下本条において同じ。）市街化区域設定年度に" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "平成六年度平成七年度平成八年度平成九年度" := by rfl
example : replacementPhraseText1 = "市街化区域設定年度市街化区域設定年度の翌年度市街化区域設定年度の翌々年度市街化区域設定年度から起算して三年度を経過した年度" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "平成六年度平成五年度前項" := by rfl
example : replacementPhraseText2 = "市街化区域設定年度市街化区域設定年度次項において準用する前項" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead5775cf7499
