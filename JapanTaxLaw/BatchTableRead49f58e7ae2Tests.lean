import JapanTaxLaw.BatchTableRead49f58e7ae2Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead49f58e7ae2

example : sourcePhraseText0 = "平成三年十二月三十一日同表の各号ものの譲渡当該各号の下欄に掲げる資産の取得を当該各号第三十一条" := by rfl
example : replacementPhraseText0 = "平成三年十二月三十一日（次の表の第十四号の上欄に掲げる資産にあつては、当該資産の譲渡の日）同表の第十四号ものの譲渡（租税特別措置法の一部を改正する法律（平成三年法律第十六号。以下「平成三年改正法」という。）附則第七条第十七項各号に掲げるものに該当する譲渡に限る。）同表の第十四号の下欄に掲げる資産の取得（平成三年改正法附則第七条第十七項各号に掲げる譲渡に応じ当該各号に定める取得に限る。）を同表の第十四号平成三年改正法による改正後の租税特別措置法第三十一条" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "平成三年十二月三十一日同表の各号の譲渡当該各号の下欄に掲げる資産の取得を当該各号" := by rfl
example : replacementPhraseText1 = "平成三年十二月三十一日（第一項の表の第十四号の上欄に掲げる資産にあつては、当該資産の譲渡の日）同表の第十四号の譲渡（平成三年改正法附則第七条第十七項各号に掲げる譲渡に該当するものに限る。）同表の第十四号の下欄に掲げる資産の取得（平成三年改正法附則第七条第十七項各号に掲げる譲渡に応じ当該各号に定める取得に限る。）を同表の第十四号" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "平成三年十二月三十一日同表の各号の譲渡（前項に規定する政令で定めるやむを得ない事情があるため、当該翌年中に当該各号の下欄に掲げる資産の取得をすることが困難である場合において、政令で定めるところにより税務署長の承認を受けたときは、当該資産の取得をすることができるものとして、当該翌年の十二月三十一日後二年以内において当該税務署長が認定した日までの期間内。次条第二項第二号において同じ。）に当該各号の下欄に掲げる資産の取得を当該各号" := by rfl
example : replacementPhraseText2 = "平成三年十二月三十一日（第一項の表の第十四号の上欄に掲げる資産にあつては、当該資産の譲渡の日）同表の第十四号の譲渡（平成三年改正法附則第七条第十七項第二号又は第三号に掲げる譲渡に該当するものに限る。）に同表の第十四号の下欄に掲げる資産の取得（平成三年改正法附則第七条第十七項第二号又は第三号に掲げる譲渡に応じこれらの規定に定める取得に限る。）を同表の第十四号" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "第三十一条第一項" := by rfl
example : replacementPhraseText3 = "平成三年改正法による改正後の租税特別措置法第三十一条第一項" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "表の各号" := by rfl
example : replacementPhraseText4 = "表の第十四号" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "並びに第十四条から第十六条まで" := by rfl
example : replacementPhraseText5 = "、第十四条から第十六条まで並びに租税特別措置法の一部を改正する法律（平成五年法律第十号）による改正後の租税特別措置法第十条第四項、第十二条の三及び第十三条の三" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "平成三年十二月三十一日同表の各号当該各号した場合（当該含む。）又は交換譲渡資産と交換取得資産以外の資産との交換をし、かつ、交換差金を取得した場合（以下この条において「他資産との交換の場合」という。）当該交換譲渡資産（他資産との交換の場合にあつては、交換差金に対応するものとして政令で定める部分に限る。）" := by rfl
example : replacementPhraseText6 = "平成三年十二月三十一日（第三十七条第一項の表の第十四号の上欄に掲げる資産にあつては、当該資産の譲渡の日）同表の第十四号同号した場合（当該交換による譲渡が平成三年改正法附則第七条第十七項第二号又は第三号に掲げる譲渡に該当し、かつ、当該交換による取得が当該譲渡に応じこれらの規定に定める取得に該当する場合に限るものとし、当該含む。）当該交換譲渡資産" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead49f58e7ae2
