import JapanTaxLaw.BatchTableRead1d2defa4f6Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead1d2defa4f6

example : sourcePhraseText0 = "道府県道府県民税道府県知事市町村市町村長" := by rfl
example : replacementPhraseText0 = "都都民税都知事特別区特別区長" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "市町村市町村民税市町村長" := by rfl
example : replacementPhraseText1 = "都都民税都知事" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "五万円" := by rfl
example : replacementPhraseText2 = "五万円（事務所、事業所又は寮等が特別区の区域以外の都の区域内にも所在する場合（以下「事務所等が特別区の区域外にも所在する場合」という。）以外の場合には、七万円）" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "十二万円" := by rfl
example : replacementPhraseText3 = "十二万円（事務所等が特別区の区域外にも所在する場合以外の場合には、十四万円）" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "十三万円" := by rfl
example : replacementPhraseText4 = "十三万円（事務所等が特別区の区域外にも所在する場合以外の場合には、十八万円）" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "十五万円" := by rfl
example : replacementPhraseText5 = "十五万円（事務所等が特別区の区域外にも所在する場合以外の場合には、二十万円）" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "十六万円" := by rfl
example : replacementPhraseText6 = "十六万円（事務所等が特別区の区域外にも所在する場合以外の場合には、二十九万円）" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "四十万円" := by rfl
example : replacementPhraseText7 = "四十万円（事務所等が特別区の区域外にも所在する場合以外の場合には、五十三万円）" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "四十一万円" := by rfl
example : replacementPhraseText8 = "四十一万円（事務所等が特別区の区域外にも所在する場合以外の場合には、第五十二条第一項の表の第四号に該当するものについては九十五万円、同表の第五号に該当するものについては百二十一万円）" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "百七十五万円" := by rfl
example : replacementPhraseText9 = "百七十五万円（事務所等が特別区の区域外にも所在する場合以外の場合には、二百二十九万円）" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "三百万円" := by rfl
example : replacementPhraseText10 = "三百万円（事務所等が特別区の区域外にも所在する場合以外の場合には、三百八十万円）" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "同項の表の各号の税率に、それぞれ一・二を乗じて得た率" := by rfl
example : replacementPhraseText11 = "同項の表の各号の税率に、それぞれ一・二を乗じて得た率（事務所等が特別区の区域外にも所在する場合以外の場合には、同項の表の各号に掲げる法人について、事務所等が特別区の区域外にも所在する場合における当該各号の税率に一・二を乗じて得た率に、当該法人に係る第五十二条第一項の表の各号に掲げる区分に応じ当該各号の税率に相当する率を、それぞれ加算して得た率）" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "百分の六百分の八・四" := by rfl
example : replacementPhraseText12 = "百分の七百分の十・四" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "並びに第五十三条第三十六項に規定する法人税割額の合計額" := by rfl
example : replacementPhraseText13 = "の合計額" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : sourcePhraseText14 = "並びに第五十三条第三十七項に規定する法人税割額の合計額" := by rfl
example : replacementPhraseText14 = "の合計額" := by rfl
example : applyReading Phrase.original14 = Phrase.replacement14 := by rfl
example : specReading Phrase.original14 = applyReading Phrase.original14 := agree_spec_impl Phrase.original14
example : sourcePhraseText15 = "並びに第五十三条第三十八項の控除の限度額で政令で定めるものの合計額" := by rfl
example : replacementPhraseText15 = "の合計額" := by rfl
example : applyReading Phrase.original15 = Phrase.replacement15 := by rfl
example : specReading Phrase.original15 = applyReading Phrase.original15 := agree_spec_impl Phrase.original15
example : sourcePhraseText16 = "道府県" := by rfl
example : replacementPhraseText16 = "都" := by rfl
example : applyReading Phrase.original16 = Phrase.replacement16 := by rfl
example : specReading Phrase.original16 = applyReading Phrase.original16 := agree_spec_impl Phrase.original16
example : sourcePhraseText17 = "道府県民税" := by rfl
example : replacementPhraseText17 = "都民税" := by rfl
example : applyReading Phrase.original17 = Phrase.replacement17 := by rfl
example : specReading Phrase.original17 = applyReading Phrase.original17 := agree_spec_impl Phrase.original17
example : sourcePhraseText18 = "道府県知事" := by rfl
example : replacementPhraseText18 = "都知事" := by rfl
example : applyReading Phrase.original18 = Phrase.replacement18 := by rfl
example : specReading Phrase.original18 = applyReading Phrase.original18 := agree_spec_impl Phrase.original18
example : sourcePhraseText19 = "市町村" := by rfl
example : replacementPhraseText19 = "特別区" := by rfl
example : applyReading Phrase.original19 = Phrase.replacement19 := by rfl
example : specReading Phrase.original19 = applyReading Phrase.original19 := agree_spec_impl Phrase.original19
example : sourcePhraseText20 = "市町村長" := by rfl
example : replacementPhraseText20 = "特別区長" := by rfl
example : applyReading Phrase.original20 = Phrase.replacement20 := by rfl
example : specReading Phrase.original20 = applyReading Phrase.original20 := agree_spec_impl Phrase.original20
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead1d2defa4f6
