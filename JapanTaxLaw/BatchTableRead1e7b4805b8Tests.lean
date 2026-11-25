import JapanTaxLaw.BatchTableRead1e7b4805b8Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead1e7b4805b8

example : sourcePhraseText0 = "代表者の氏名" := by rfl
example : replacementPhraseText0 = "代表者の氏名及び法第百四十一条各号（課税標準）に定める国内源泉所得に係る事業又は資産の経営又は管理の責任者の氏名" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "その資産" := by rfl
example : replacementPhraseText1 = "法第百四十一条各号（課税標準）に定める国内源泉所得に係る所得（以下この章において「国内源泉所得に係る所得」という。）に関連する資産" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "取引" := by rfl
example : replacementPhraseText2 = "取引（恒久的施設を有する外国法人にあつては、法第百三十八条第一項第一号（国内源泉所得）に規定する内部取引に該当するものを含む。以下この章において同じ。）" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "全ての取引" := by rfl
example : replacementPhraseText3 = "国内源泉所得に係る所得に影響を及ぼす全ての取引" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "貸借対照表及び損益計算書" := by rfl
example : replacementPhraseText4 = "法第百四十一条各号（課税標準）に定める国内源泉所得に係る貸借対照表及び損益計算書（国内及び国外にわたつて船舶又は航空機による運送の事業を行う青色申告法人にあつては、当該貸借対照表及び損益計算書のほか、当該事業の全体に係る貸借対照表及び損益計算書とする。）" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "書類にあつては、当該納税地又は同号の取引に係る国内の事務所、事業所その他これらに準ずるものの所在地）に保存しなければならない" := by rfl
example : replacementPhraseText5 = "書類のうち同号の取引に係る事務所、事業所その他これらに準ずるもの（以下この項において「事務所等」という。）の所在地に保存することがその青色申告法人が行う事業の内容及び実態等に照らして合理的と認められるものについては、当該取引に係る事務所等の所在地）に保存しなければならない。この場合において、第一号又は第二号に掲げる帳簿書類のうち納税地に保存することを困難とする相当の理由があると認められるものについては、当該帳簿書類の写しを納税地に保存していることをもつて当該帳簿書類を納税地に保存しているものとみなす" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "資産" := by rfl
example : replacementPhraseText6 = "国内源泉所得に係る所得に関連する資産" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "貸借対照表及び損益計算書" := by rfl
example : replacementPhraseText7 = "法第百四十一条各号（課税標準）に定める国内源泉所得に係る貸借対照表及び損益計算書（国内及び国外にわたつて船舶又は航空機による運送の事業を行う青色申告法人にあつては、当該貸借対照表及び損益計算書のほか、当該事業の全体に係る貸借対照表及び損益計算書とする。）" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "書類" := by rfl
example : replacementPhraseText8 = "書類で国内源泉所得に係る所得に影響を及ぼす一切のもの" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "取引" := by rfl
example : replacementPhraseText9 = "国内源泉所得に係る所得に影響を及ぼす一切の取引" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "ものはその写し" := by rfl
example : replacementPhraseText10 = "ものはその写し並びに第六十二条の三第一号（内部取引に関する書類）に掲げる書類又はその写し" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "第七十四条第一項" := by rfl
example : replacementPhraseText11 = "第百四十四条の六第一項又は第二項" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "第七十五条の二第一項" := by rfl
example : replacementPhraseText12 = "第百四十四条の八（確定申告書の提出期限の延長の特例）において準用する法第七十五条の二第一項" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "代表者の氏名" := by rfl
example : replacementPhraseText13 = "代表者の氏名及び法第百四十一条各号（課税標準）に定める国内源泉所得に係る事業又は資産の経営又は管理の責任者の氏名" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead1e7b4805b8
