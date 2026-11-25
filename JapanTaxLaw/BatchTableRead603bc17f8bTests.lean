import JapanTaxLaw.BatchTableRead603bc17f8bSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead603bc17f8b

example : sourcePhraseText0 = "平成三年三月三十一日同表の各号）の譲渡当該各号の下欄に掲げる資産の取得を当該各号" := by rfl
example : replacementPhraseText0 = "平成三年三月三十一日（次の表の第十五号の上欄に掲げる資産にあつては、当該資産の譲渡の日）同表の第十五号）の譲渡（租税特別措置法の一部を改正する法律（平成三年法律第十六号。以下「平成三年改正法」という。）附則第十五条第八項各号に掲げるものに該当する譲渡に限る。）同表の第十五号の下欄に掲げる資産の取得（平成三年改正法附則第十五条第八項各号に掲げる譲渡に応じ当該各号に定める取得に限る。）を同表の第十五号" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "表の各号の譲渡当該各号の下欄に掲げる資産の取得を当該各号" := by rfl
example : replacementPhraseText1 = "表の第十五号の譲渡（平成三年改正法附則第十五条第八項各号に掲げる譲渡に該当するものに限る。）同表の第十五号の下欄に掲げる資産の取得（平成三年改正法附則第十五条第八項各号に掲げる譲渡に応じ当該各号に定める取得に限る。）を同表の第十五号" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "各号" := by rfl
example : replacementPhraseText2 = "第十五号" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "第五十二条の三第一項" := by rfl
example : replacementPhraseText3 = "第五十二条の三第一項（平成三年改正法による改正後のこれらの規定を含む。）並びに租税特別措置法の一部を改正する法律（平成五年法律第十号）による改正後の租税特別措置法第四十六条の三及び第四十六条の四並びにこれらの規定に係る同法第五十二条の三第一項並びに同法第四十二条の四第四項" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "第六十四条第一項第一号第六十四条第二項" := by rfl
example : replacementPhraseText4 = "平成三年改正法による改正後の租税特別措置法第六十四条第一項第一号同法第六十四条第二項" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "平成三年三月三十一日で同表の各号）の譲渡当該各号に掲げる資産の取得をすること係る同表の各号" := by rfl
example : replacementPhraseText5 = "平成三年三月三十一日（前条第一項の表の第十五号の上欄に掲げる資産にあつては、当該資産の譲渡の日）で同表の第十五号）の譲渡（平成三年改正法附則第十五条第八項第二号又は第三号に掲げる譲渡に該当するものに限る。）同表の第十五号に掲げる資産の取得（平成三年改正法附則第十五条第八項第二号又は第三号に掲げる譲渡に応じこれらの規定に定める取得に限る。以下この条において同じ。）をすること同号" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "表の各号当該各号" := by rfl
example : replacementPhraseText6 = "表の第十五号同号" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "表の各号" := by rfl
example : replacementPhraseText7 = "表の第十五号" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "平成三年三月三十一日同表の各号当該各号した場合（当該含む。）又は交換譲渡資産と交換取得資産以外の資産との交換をし、かつ、交換差金を取得した場合（以下この条において「他資産との交換の場合」という。）当該交換譲渡資産（他資産との交換の場合にあつては、交換差金に対応するものとして政令で定める部分に限る。）" := by rfl
example : replacementPhraseText8 = "平成三年三月三十一日（第六十五条の七第一項の表の第十五号の上欄に掲げる資産にあつては、当該資産の譲渡の日）同表の第十五号同号した場合（当該交換による譲渡が平成三年改正法附則第十五条第八項第二号又は第三号に掲げる譲渡に該当し、かつ、当該交換による取得が当該譲渡に応じこれらの規定に定める取得に該当する場合に限るものとし、当該含む。）当該交換譲渡資産" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead603bc17f8b
