import JapanTaxLaw.BatchTableRead2f95c0bfd6Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead2f95c0bfd6

example : sourcePhraseText0 = "読み替えられる字句" := by rfl
example : replacementPhraseText0 = "読み替える字句" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "税務署長等（国税庁長官、国税局長若しくは税務署長又は税関長をいう。以下第七十四条の十一（調査の終了の際の手続）までにおいて同じ。）" := by rfl
example : replacementPhraseText1 = "税関長" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "国税庁等又は税関" := by rfl
example : replacementPhraseText2 = "税関" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "（以下同条" := by rfl
example : replacementPhraseText3 = "（以下第七十四条の十一" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "納税義務者に対し" := by rfl
example : replacementPhraseText4 = "輸入者に対し" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "調査（税関の当該職員が行う調査にあつては、消費税等の課税物件の保税地域からの引取り後に行うもの又は国際観光旅客税について行うものに限る。以下同条までにおいて同じ。）" := by rfl
example : replacementPhraseText5 = "調査" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "第七十四条の二から第七十四条の六まで（当該職員の質問検査権）" := by rfl
example : replacementPhraseText6 = "関税法第百五条第一項第六号（税関職員の権限）" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "納税義務者（当該納税義務者について税務代理人がある場合には、当該税務代理人を含む。）" := by rfl
example : replacementPhraseText7 = "輸入者" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "税務署長等納税義務者" := by rfl
example : replacementPhraseText8 = "税関長輸入者" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "税務署長等" := by rfl
example : replacementPhraseText9 = "税関長" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "同条第三項第一号に掲げる納税義務者" := by rfl
example : replacementPhraseText10 = "輸入者" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "国税庁等若しくは税関" := by rfl
example : replacementPhraseText11 = "税関" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "国税に" := by rfl
example : replacementPhraseText12 = "関税に" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "税務署長等国税" := by rfl
example : replacementPhraseText13 = "税関長関税" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : sourcePhraseText14 = "更正決定等（第三十六条第一項（第二号に係る部分に限る。）（納税の告知）の規定による納税の告知を含む。以下この条において同じ。）" := by rfl
example : replacementPhraseText14 = "更正、決定又は賦課決定（以下この条において「更正決定等」という。）" := by rfl
example : applyReading Phrase.original14 = Phrase.replacement14 := by rfl
example : specReading Phrase.original14 = applyReading Phrase.original14 := agree_spec_impl Phrase.original14
example : sourcePhraseText15 = "納税義務者（第七十四条の九第三項第一号（納税義務者に対する調査の事前通知等）に掲げる納税義務者をいう。以下この条において同じ。）" := by rfl
example : replacementPhraseText15 = "輸入者" := by rfl
example : applyReading Phrase.original15 = Phrase.replacement15 := by rfl
example : specReading Phrase.original15 = applyReading Phrase.original15 := agree_spec_impl Phrase.original15
example : sourcePhraseText16 = "国税納税義務者" := by rfl
example : replacementPhraseText16 = "関税輸入者" := by rfl
example : applyReading Phrase.original16 = Phrase.replacement16 := by rfl
example : specReading Phrase.original16 = applyReading Phrase.original16 := agree_spec_impl Phrase.original16
example : sourcePhraseText17 = "納税義務者期限後申告" := by rfl
example : replacementPhraseText17 = "輸入者関税法第七条の四第一項（期限後特例申告）の規定による期限後特例申告" := by rfl
example : applyReading Phrase.original17 = Phrase.replacement17 := by rfl
example : specReading Phrase.original17 = applyReading Phrase.original17 := agree_spec_impl Phrase.original17
example : sourcePhraseText18 = "納税申告書" := by rfl
example : replacementPhraseText18 = "これらの申告に係る申告書" := by rfl
example : applyReading Phrase.original18 = Phrase.replacement18 := by rfl
example : specReading Phrase.original18 = applyReading Phrase.original18 := agree_spec_impl Phrase.original18
example : sourcePhraseText19 = "納税義務者期限後申告書の提出若しくは源泉徴収等による国税の納付" := by rfl
example : replacementPhraseText19 = "輸入者関税法第七条の四第二項に規定する期限後特例申告書の提出" := by rfl
example : applyReading Phrase.original19 = Phrase.replacement19 := by rfl
example : specReading Phrase.original19 = applyReading Phrase.original19 := agree_spec_impl Phrase.original19
example : sourcePhraseText20 = "第七十四条の二から第七十四条の六まで（当該職員の質問検査権）" := by rfl
example : replacementPhraseText20 = "関税法第百五条第一項第六号（税関職員の権限）" := by rfl
example : applyReading Phrase.original20 = Phrase.replacement20 := by rfl
example : specReading Phrase.original20 = applyReading Phrase.original20 := agree_spec_impl Phrase.original20
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead2f95c0bfd6
