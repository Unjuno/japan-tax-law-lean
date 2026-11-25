import JapanTaxLaw.BatchMultiRead39fa77b16dSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchMultiRead39fa77b16d

example : sourcePhraseText0 = "第一項又は第四項" := by rfl
example : replacementPhraseText0 = "第十二項" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "非課税適用申告書又は組合等届出書及び組合契約書等の写しが第一項" := by rfl
example : replacementPhraseText1 = "同項各号に定める申告書又は届出書及び組合契約書等の写しが第一項" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "非課税適用申告書を提出する者" := by rfl
example : replacementPhraseText2 = "次項第一号又は第三号に定める申告書を提出する者" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "当該非課税適用申告書" := by rfl
example : replacementPhraseText3 = "これらの号に定める申告書" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "氏名又は" := by rfl
example : replacementPhraseText4 = "氏名若しくは" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "住所（同項" := by rfl
example : replacementPhraseText5 = "住所又は変更後の氏名若しくは名称及び住所（第二項" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "住所並びに" := by rfl
example : replacementPhraseText6 = "住所又は変更後の氏名若しくは名称及び住所並びに" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "の名称" := by rfl
example : replacementPhraseText7 = "の名称又は変更後の名称" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchMultiRead39fa77b16d
