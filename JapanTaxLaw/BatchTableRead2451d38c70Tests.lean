import JapanTaxLaw.BatchTableRead2451d38c70Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead2451d38c70

example : sourcePhraseText0 = "租税特別措置法第四十一条の八第五項第一号" := by rfl
example : replacementPhraseText0 = "租税特別措置法の一部を改正する法律（平成七年法律第五十五号）附則第十九条の規定によりなお効力を有することとされる同法による改正前の租税特別措置法第四十一条の六第五項第一号" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "租税特別措置法第四十一条の八第七項" := by rfl
example : replacementPhraseText1 = "租税特別措置法の一部を改正する法律（平成七年法律第五十五号）附則第十九条の規定によりなお効力を有することとされる同法による改正前の租税特別措置法第四十一条の六第七項" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "第四十一条の八第七項地方税法「法」係る法又は法" := by rfl
example : replacementPhraseText2 = "第四十一条の六第七項地方税法の一部を改正する法律（平成七年法律第四十号）附則第十五条の規定によりなお効力を有することとされる同法による改正前の地方税法「改正前の地方税法」係る地方税法又は改正前の地方税法" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "第四十一条の八第八項法" := by rfl
example : replacementPhraseText3 = "第四十一条の六第八項改正前の地方税法" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "第四十一条の八第九項法附則第三十五条の三第一項法第十六条第三項法第十五条の三第二項" := by rfl
example : replacementPhraseText4 = "第四十一条の六第九項改正前の地方税法附則第三十五条の三第一項地方税法第十六条第三項同法第十五条の三第二項" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "第四十一条の八第十項法附則第三十五条の三第一項法第十一条の四第一項" := by rfl
example : replacementPhraseText5 = "第四十一条の六第十項改正前の地方税法附則第三十五条の三第一項地方税法第十一条の四第一項" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "租税特別措置法施行令同令第四十一条の八第一項地方税法（昭和二十五年法律第二百二十六号）第四十一条の八第五項地方税法附則第三十五条の三第一項地方税法附則第三十五条の三第二項地方税法附則第三十五条の三及び地方税法施行令" := by rfl
example : replacementPhraseText6 = "租税特別措置法施行令の一部を改正する政令（平成七年政令第百五十八号）附則第十四条の規定によりなお効力を有することとされる同令による改正前の租税特別措置法施行令租税特別措置法施行令の一部を改正する政令附則第十四条の規定により読み替えられた同令による改正前の租税特別措置法施行令第四十一条の六第一項地方税法の一部を改正する法律（平成七年法律第四十号）附則第十五条の規定によりなお効力を有することとされる同法による改正前の地方税法（昭和二十五年法律第二百二十六号。以下この条において「改正前の地方税法」という。）第四十一条の六第五項改正前の地方税法附則第三十五条の三第一項改正前の地方税法附則第三十五条の三第二項改正前の地方税法附則第三十五条の三及び地方税法施行令の一部を改正する政令（平成七年政令第百四十二号）附則第八条の規定によりなお効力を有することとされる同令による改正前の地方税法施行令" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead2451d38c70
