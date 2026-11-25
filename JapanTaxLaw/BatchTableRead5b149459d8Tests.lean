import JapanTaxLaw.BatchTableRead5b149459d8Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead5b149459d8

example : sourcePhraseText0 = "内国法人である普通法人又は協同組合等の設立の日の属する事業年度同日" := by rfl
example : replacementPhraseText0 = "恒久的施設を有する外国法人である普通法人の恒久的施設を有することとなつた日の属する事業年度又は恒久的施設を有しない外国法人である普通法人の第百三十八条第一項第四号（国内源泉所得）に規定する事業（第四号において「人的役務提供事業」という。）を国内において開始した日の属する事業年度若しくは当該普通法人の第百四十一条第二号（課税標準）に定める国内源泉所得で同項第四号に掲げる対価以外のものを有することとなつた日の属する事業年度その恒久的施設を有することとなつた日又はその開始した日若しくはその対価以外のものを有することとなつた日" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "収益事業を開始した日" := by rfl
example : replacementPhraseText1 = "第百四十一条各号に掲げる外国法人の区分に応じ当該各号に定める国内源泉所得で収益事業から生ずるものを有することとなつた日" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "内国法人である普通法人若しくは協同組合等の設立の日、" := by rfl
example : replacementPhraseText2 = "恒久的施設を有しない外国法人である普通法人が人的役務提供事業を国内において開始した日、当該普通法人が第百四十一条第二号に定める国内源泉所得で第百三十八条第一項第四号に掲げる対価以外のものを有することとなつた日又は" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "収益事業を開始した日又は前号イ若しくはロに掲げる法人の区分に応じそれぞれ同号イ若しくはロに定める日" := by rfl
example : replacementPhraseText3 = "第百四十一条各号に掲げる外国法人の区分に応じ当該各号に定める国内源泉所得で収益事業から生ずるものを有することとなつた日" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "設立等の日" := by rfl
example : replacementPhraseText4 = "申告対象外国法人となつた日" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "取引" := by rfl
example : replacementPhraseText5 = "取引（恒久的施設を有する外国法人にあつては、第百三十八条第一項第一号（国内源泉所得）に規定する内部取引に該当するものを含む。第百二十六条第一項及び第百二十七条第一項第三号（青色申告の承認の取消し）において同じ。）" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "第七十二条第一項各号" := by rfl
example : replacementPhraseText6 = "第百四十四条の四第一項各号又は第二項各号" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "第七十四条第一項" := by rfl
example : replacementPhraseText7 = "第百四十四条の六第一項又は第二項" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead5b149459d8
